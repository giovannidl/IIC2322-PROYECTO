package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

import coolc.ast.AssignExpr;
import coolc.ast.BinaryExpr;
import coolc.ast.Block;
import coolc.ast.CaseExpr;
import coolc.ast.ClassDef;
import coolc.ast.DispatchExpr;
import coolc.ast.Expr;
import coolc.ast.Feature;
import coolc.ast.IdExpr;
import coolc.ast.IfExpr;
import coolc.ast.LetExpr;
import coolc.ast.Method;
import coolc.ast.NewExpr;
import coolc.ast.Program;
import coolc.ast.UnaryExpr;
import coolc.ast.ValueExpr;
import coolc.ast.Variable;
import coolc.ast.WhileExpr;
import coolc.infrastructure.ClassScope;
import coolc.infrastructure.Field;
import coolc.infrastructure.MethodScope;
import coolc.infrastructure.Scope;
import coolc.infrastructure.SymTable;

public class LlvmGenerator
{
	private SymTable _symTable;
	private Program _root;
	private CodeBuffer _buffer;
	
	private String _lastTrueLabel;
	private String _lastFalseLabel;
	
	public LlvmGenerator(Program root, SymTable symTable)
	{
		this._root = root;
		this._symTable = symTable;
		this._buffer = new CodeBuffer();
		
		this._lastTrueLabel = null;
		this._lastFalseLabel = null;
	}
	
	public void generateCode()
	{
		generateClasses();
	}
	
	public void print()
	{
		System.out.println(this._buffer.getPrintableCode());
	}
	
	private void generateClasses()
	{	
		for(ClassDef c : this._root)
		{
			ClassDefinitionCode classCode = new ClassDefinitionCode(c.getType());
			this._buffer.addClassDefinition(classCode);
			MethodCode initializeCode = new InitializeMethodCode("", c.getType());
			this._buffer.addInitializeMethod(initializeCode);
			
			ClassScope scope = _symTable.findClass(c.getType());
			
			assert scope != null : "Fatal error, this is impossible!";
			
			for(Feature feature : c.getBody())
			{
				if(feature instanceof Method)
				{
					Method method = (Method) feature;
					List < String[] > params = new ArrayList < String[] > ();
					
					for(Variable param : method.getParams())
					{
						params.add(new String[] {this.processReturnType(param.getType()), param.getId()});
					}
					
					DefineMethodCode methodCode = new DefineMethodCode(method.getName(), 
							scope.getClassType(), this.processReturnType(method.getType()), params);
					
					String returnVariable = this.processMethodExpr(method.getBody(), method.getScope()
											, methodCode);
					if(method.getType().equals("Object") && !methodCode.getLastVarType().equals("%Object*"))
					{
						String castVar = this._buffer.getNextVariableName();
						String code = castVar + " = bitcast " + methodCode.getLastVarType() + " " +
										returnVariable + " to %Object*";
						methodCode.addBodyCode(code);
						returnVariable = castVar;
					}
					methodCode.setReturnVariable(returnVariable);  
					
					this._buffer.addDefineMethod(methodCode);
				}
				
				else if(feature instanceof Variable)
				{
					Variable var = (Variable) feature;
					String returnType = var.getType();

					if("SELF_TYPE".equals(returnType))
					{
						returnType = scope.getClassType();
					}
					
					AttributeCode attrCode = new AttributeCode(var.getId(), this.processReturnType(var.getType()),
							scope.getClassType());
					
					this._buffer.addAttribute(attrCode);
					if(var.getValue() != null)
					{
						String varAttr = this.processMethodExpr(var.getValue(), scope, initializeCode);
						String attrType = this.processReturnType(var.getValue().getExprType());
						String code = "store " + attrType + " " + varAttr + ", " + attrType + "* " +
										attrCode.getName();
						initializeCode.addBodyCode(code);
					}
				}
			}
		}
	}
	
	private String processReturnType(String type)
	{
		switch(type)
		{
		case "String":
			return "i8*";
		case "Int":
			return "i32";
		case "Bool":
			return "i1";
		default:
			return "%" + type + "*";
		}
	}
	
	private String processMethodExpr(Expr expr, Scope scope, MethodCode methodCode)
	{
		String variableName = null;
		
		if(expr instanceof Block)
		{
			for(Expr child : ((Block) expr).getStatements())
			{
				variableName = this.processMethodExpr(child, scope, methodCode);
			}
		}
		else if(expr instanceof WhileExpr)
		{
			
		}
		else if(expr instanceof AssignExpr)
		{
			AssignExpr assExpr = (AssignExpr)expr;
			Field field = scope.getField(assExpr.getId());
			
			if(field.getParent() instanceof ClassScope)
			{
				variableName = this.processMethodExpr(assExpr.getValue(), scope, methodCode);
				String varType = this.processReturnType(assExpr.getValue().getExprType());
				String code = "store " + varType + " " + variableName + ", " + varType + "* @_" +
						scope.getClassScope().getClassType() + "_" + assExpr.getId();
				methodCode.addBodyCode(code);
			}
			else if(field.getParent() instanceof MethodScope)
			{
				String valueName = this.processMethodExpr(assExpr.getValue(), scope, methodCode);
				String varType = this.processReturnType(assExpr.getValue().getExprType());
				variableName = "%." + field.getClassScope().getClassType() + "." + assExpr.getId();
				String code = variableName + "= ";
				if(varType.equals("i32") || varType.equals("i1"))
				{
					code += "add " + varType + " 0, " +  valueName;
				}
				else
				{
					code += "getelementptr " + varType + " " + valueName;
				}
				methodCode.addBodyCode(code);
			}
		}
		else if(expr instanceof DispatchExpr)
		{
			DispatchExpr call = (DispatchExpr) expr;

			ClassScope calleeScope;
			String callVar = null;

			if(call.getExpr() != null)
			{
				calleeScope = _symTable.findClass(call.getExpr().getExprType());
				callVar = this.processMethodExpr(call.getExpr(), scope, methodCode);
			}
			
			else
			{
				calleeScope = scope.getClassScope();
			}
			
			if( calleeScope != null && call.getType() != null )
			{
				calleeScope = _symTable.findClass(call.getType());
			}
			
			MethodScope method = calleeScope != null ? calleeScope.getMethod(call.getName()) : null ;
			
			variableName = this._buffer.getNextVariableName();
			String returnType = method.getReturnType();
			
			String classMethodName = calleeScope.getClassDefMethod(call.getName());
			String firstArgs = null;
			
			if("SELF_TYPE".equals(returnType))
			{
				returnType = classMethodName;
			}
			if(callVar != null)
			{
				firstArgs = this.processReturnType(call.getExpr().getExprType()) + " " + callVar;
			}
			else
			{
				firstArgs = this.processReturnType(scope.getClassScope().getClassType()) + " " +
						methodCode.getParamName(0);
				if(!classMethodName.equals(scope.getClassScope().getClassType()))
				{
					firstArgs = this.processReturnType(calleeScope.getSuperType()) + " " + methodCode.getSuperVarNam(returnType);
				}
			}
			
			String code = 	variableName + " = call " + this.processReturnType(returnType) + 
							" @" + classMethodName + "_" + call.getName() + "(" +
							firstArgs + ", ";

			int argCount = call.getArgs().size();
			for(int i = 0; i < argCount; i++)
			{
				String argName = processMethodExpr(call.getArgs().get(i) , scope, methodCode);
				code += this.processReturnType(call.getArgs().get(i).getExprType()) + " " + argName + ", ";
			}
			code = code.substring(0, code.length() - 2);
			
			code += ")\n";
			methodCode.addBodyCode(code);
		}
		else if(expr instanceof IfExpr)
		{
			IfExpr ifExpr = (IfExpr) expr;
			String[] condNames = this._buffer.getNextConditionNames();
			
			String condVar = processMethodExpr(ifExpr.getCond(), scope, methodCode);
			String code = "br " + this.processReturnType(ifExpr.getCond().getExprType()) + " " + condVar
					+ ", label %" + condNames[0] + ", label %" + condNames[1];
			methodCode.addBodyCode(code);

			this._lastTrueLabel = condNames[0];
			methodCode.addBodyCode(condNames[0] + ":");
			String trueVar = processMethodExpr(ifExpr.getTrue(), scope, methodCode);
			methodCode.addBodyCode("br label %" + condNames[2]);

			this._lastFalseLabel = condNames[1];
			methodCode.addBodyCode(condNames[1] + ":");
			String falseVar = processMethodExpr(ifExpr.getFalse(), scope, methodCode);
			methodCode.addBodyCode("br label %" + condNames[2]);
			
			methodCode.addBodyCode(condNames[2] + ":");
			variableName = this._buffer.getNextVariableName();
			code = variableName + " = phi " + this.processReturnType(ifExpr.getExprType()) + " [ " +
					trueVar + ", %" + this._lastTrueLabel + " ], [ " + falseVar + ", %" + this._lastFalseLabel + " ]";
			methodCode.addBodyCode(code);
			this._lastTrueLabel = condNames[2];
			this._lastFalseLabel = condNames[2];
		}
		else if(expr instanceof NewExpr)
		{
			
		}
		else if(expr instanceof UnaryExpr)
		{
			UnaryExpr unExpr = (UnaryExpr)expr;
			String valueVar = processMethodExpr(unExpr.getValue(), scope, methodCode);
			String code = null;
			
			switch(unExpr.getOp())
			{
				case ISVOID:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = icmp eq void void, " + valueVar;
					methodCode.addBodyCode(code);
					break;

				case NEGATE:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = xor i32 " + valueVar + ", -1";
					methodCode.addBodyCode(code);
					break;

				case NOT:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = xor i1 1, " + valueVar;
					methodCode.addBodyCode(code);
					break;

				default:
					throw new RuntimeException("Invalid unary op");
			}
		}
		else if(expr instanceof BinaryExpr)
		{
			BinaryExpr binExpr = (BinaryExpr)expr;

			String leftVar = processMethodExpr(binExpr.getLeft(), scope, methodCode);
			String rightVar = processMethodExpr(binExpr.getRight(), scope, methodCode);

			String code = null;
			switch(binExpr.getOp())
			{
				case PLUS:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = add " + this.processReturnType(binExpr.getExprType()) +
									" " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;
				case MINUS:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = sub " + this.processReturnType(binExpr.getExprType()) +
									" " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;
				case MULT:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = mul " + this.processReturnType(binExpr.getExprType()) +
									" " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;
				case DIV:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = sdiv " + this.processReturnType(binExpr.getExprType()) +
									" " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;
				case LT:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = icmp slt i32 " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;
				case LTE:
					variableName = this._buffer.getNextVariableName();
					code = variableName + " = icmp sle i32 " + leftVar + ", " + rightVar;
					methodCode.addBodyCode(code);
					break;

				case EQUALS:
					if(binExpr.getLeft().getExprType().equals("Int") || 
							binExpr.getLeft().getExprType().equals("Bool"))
					{
						variableName = this._buffer.getNextVariableName();
						code = variableName + " = icmp eq " + this.processReturnType(binExpr.getLeft().getExprType()) +
								" " + leftVar + ", " + rightVar;
						methodCode.addBodyCode(code);
					}
					else if(binExpr.getLeft().getExprType().equals("String"))
					{
						String resultVar = this._buffer.getNextVariableName();
						code = resultVar + " = call i32 @strcmp(i8* " + leftVar + ", i8* " + rightVar + ")";
						methodCode.addBodyCode(code);
						
						variableName = this._buffer.getNextVariableName();
						code = variableName + " = icmp eq i32 0, " + resultVar;
						methodCode.addBodyCode(code);
					}
					break;

				default:
					throw new RuntimeException("Invalid binary op");
			}
		}
		else if(expr instanceof CaseExpr)
		{
			
		}
		else if(expr instanceof LetExpr)
		{
			
		}
		else if(expr instanceof IdExpr)
		{
			IdExpr id = (IdExpr)expr;
			Field field = scope.getField(id.getId());
			
			if(field.getParent() instanceof ClassScope)
			{
				variableName = this._buffer.getNextVariableName();
				String code = variableName + " = load " + this.processReturnType(id.getExprType()) + "* @_" + 
						field.getClassScope().getClassType() + "_" + id.getId() + "\n";
				methodCode.addBodyCode(code);
			}
			else if(field.getParent() instanceof MethodScope)
			{
				variableName = "%." + field.getClassScope().getClassType() + "." + id.getId();
			}
		}
		else if(expr instanceof ValueExpr)
		{
			Object value = ((ValueExpr<?>)expr).getValue();
			
			if(value instanceof String)
			{
				ConstantStringCode constantCode = new ConstantStringCode((String)value);
				this._buffer.addConstantString(constantCode);
				
				String globalVar = this._buffer.getNextVariableName();
				String code = globalVar + " = load " + constantCode.getType() + " " + constantCode.getName() + "\n";
				methodCode.addBodyCode(code);
				
				variableName = this._buffer.getNextVariableName();
				code = variableName + " = bitcast " + constantCode.getType() + " " + constantCode.getName() +
						" to i8*\n";
				methodCode.addBodyCode(code);
			}
			else if(value instanceof Integer)
			{
				variableName = "" + ((Integer)value);
			}
			else if(value instanceof Boolean)
			{
				String booleanValue = "0";
				if(((Boolean)value).booleanValue())
					booleanValue = "1";
				
				variableName = "" + booleanValue;
			}
		}

		methodCode.setLastVarType(this.processReturnType(expr.getExprType()));
		return variableName;
	}
}