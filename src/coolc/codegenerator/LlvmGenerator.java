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
			ClassScope scope = _symTable.findClass(c.getType());
			ClassDefinitionCode classCode;
			InitializeMethodCode initializeCode;
			
			//Vemos si la clase hereda de otra clase. Si es asi se le pasa su herencia.
			if(scope.getSuperScope().getClassType().equals("Object"))
			{
				classCode = new ClassDefinitionCode(c.getType());
				initializeCode = new InitializeMethodCode(c.getType());
			}
			else
			{
				classCode = new ClassDefinitionCode(c.getType(), this._buffer.getClassDefCode(scope.getSuperType()));
				initializeCode = new InitializeMethodCode(c.getType(), this._buffer.getClassInitCode(scope.getSuperType()));
			}
			this._buffer.addClassDefinition(classCode);
			this._buffer.addInitializeMethod(initializeCode);
			
			for(Feature feature : c.getBody())
			{
				if(feature instanceof Method)
				{
					Method method = (Method) feature;
					List < String[] > params = new ArrayList < String[] > ();
					
					String returnType = method.getType();
					if("SELF_TYPE".equals(returnType))
					{
						returnType = scope.getClassType();
					}
					
					if(method.getName().equals("main"))
					{
						this._buffer.setMainClass(c.getType(), returnType);
					}
					
					for(Variable param : method.getParams())
					{
						params.add(new String[] {this.processReturnType(param.getType()), param.getId()});
					}
					
					DefineMethodCode methodCode = new DefineMethodCode(method.getName(), 
							scope.getClassType(), this.processReturnType(returnType), params);  
					
					this._buffer.addDefineMethod(methodCode);
					
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
					else if(returnType.equals(scope.getClassType()) && !methodCode.getLastVarType().equals(scope.getClassType()))
					{
						String castVar = this._buffer.getNextVariableName();
						String code = castVar + " = bitcast " + methodCode.getLastVarType() + " " +
										returnVariable + " to %" + scope.getClassType() + "*";
						methodCode.addBodyCode(code);
						returnVariable = castVar;
					}
					
					methodCode.setReturnVariable(returnVariable);
				}
				
				else if(feature instanceof Variable)
				{
					Variable var = (Variable) feature;
					String returnType = var.getType();

					if("SELF_TYPE".equals(returnType))
					{
						returnType = scope.getClassType();
					}
					
					classCode.addAttrType(this.processReturnType(var.getType()), var.getId());
					
					if(var.getValue() != null)
					{
						String varAttr = this.processMethodExpr(var.getValue(), scope, initializeCode);
						String attrType = this.processReturnType(var.getValue().getExprType());
						
						String ptrVariable = this._buffer.getNextVariableName();
						String code = ptrVariable + " = getelementptr inbounds " + this.processReturnType(classCode.getClassType()) +
										" %self, i32 0, i32 " + classCode.getAttributePosition(var.getId());
						initializeCode.addAttributePointerCode(code);
						
						code = "store " + attrType + " " + varAttr + ", " + attrType + "* " + ptrVariable;
						initializeCode.addBodyCode(code);
					}
					else if(var.getType().equals("Int") || var.getType().equals("String") || 
							var.getType().equals("Bool"))
					{
						String ptrVariable = this._buffer.getNextVariableName();
						String code = ptrVariable + " = getelementptr inbounds " + this.processReturnType(classCode.getClassType()) +
										" %self, i32 0, i32 " + classCode.getAttributePosition(var.getId());
						initializeCode.addAttributePointerCode(code);
						
						String varType = this.processReturnType(var.getType());
						code = "store " + varType + " " + initializeCode.getDefaultValue(varType) + ", " + varType + "* " +
								ptrVariable;
						initializeCode.addBodyCode(code);
					}
					else
					{
						String ptrVariable = this._buffer.getNextVariableName();
						String code = ptrVariable + " = getelementptr inbounds " + this.processReturnType(classCode.getClassType()) +
										" %self, i32 0, i32 " + classCode.getAttributePosition(var.getId());
						initializeCode.addAttributePointerCode(code);
						
						String varType = this.processReturnType(var.getType());
						code = "store " + varType + " null, " + varType + "* " +
								ptrVariable;
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
			WhileExpr loop = (WhileExpr) expr;
			
			String condVar = this.processMethodExpr(loop.getCond(), scope, methodCode);
			String[] whileNames = this._buffer.getNextWhileNames();
			
			String code = "br i1 " + condVar + ", label %" + whileNames[0] + ", label %" + whileNames[1];
			methodCode.addBodyCode(code);
			
			methodCode.addBodyCode(whileNames[0] + ":");
			
			this.processMethodExpr(loop.getValue(), scope, methodCode);
			
			condVar = this.processMethodExpr(loop.getCond(), scope, methodCode);
			code = "br i1 " + condVar + ", label %" + whileNames[0] + ", label %" + whileNames[1];
			methodCode.addBodyCode(code);
			
			methodCode.addBodyCode(whileNames[1] + ":");
			
			variableName = this._buffer.getNextVariableName();
			code = variableName + " = getelementptr %Object* null";
			methodCode.addBodyCode(code);
		}
		else if(expr instanceof AssignExpr)
		{
			AssignExpr assExpr = (AssignExpr)expr;
			Field field = scope.getField(assExpr.getId());
			
			if(field.getParent() instanceof ClassScope)
			{
				variableName = this.processMethodExpr(assExpr.getValue(), scope, methodCode);
				String varType = this.processReturnType(assExpr.getValue().getExprType());
				String ptrVariable = this._buffer.getNextVariableName();
				String code = ptrVariable + " = getelementptr inbounds " + this.processReturnType(scope.getClassScope().getClassType()) +
								" %self, i32 0, i32 " + this._buffer.getAttributePosition(scope.getClassScope().getClassType(), assExpr.getId());
				methodCode.addBodyCode(code);
				
				code = "store " + varType + " " + variableName + ", " + varType + "* " + ptrVariable;
				methodCode.addBodyCode(code);
			}
			else
			{
				String valueName = this.processMethodExpr(assExpr.getValue(), scope, methodCode);
				String varType = this.processReturnType(assExpr.getValue().getExprType());
				
				String allocateVar = "%_" +	field.getClassScope().getClassType() + "_" + methodCode.getName() + "_"+ assExpr.getId();
				if(!this._buffer.isIdInitialized(allocateVar, methodCode.getName()))
				{
					String allocateCode = allocateVar + " = alloca " + varType + ", align 4\n";
					methodCode.addBodyCode(allocateCode);
					this._buffer.addId(allocateVar, methodCode.getName());
				}
				
				variableName = valueName;
				String code = "store " + varType + " " + valueName + ", " + varType + "* " + allocateVar;
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
			
			if(callVar != null && !callVar.equals("%self"))
			{
				if(call.getExpr().getExprType().equals(classMethodName))
				{
					firstArgs = this.processReturnType(call.getExpr().getExprType()) + " " + callVar;
				}
				else
				{
					String castVar = this._buffer.getNextVariableName();
					String castCode = castVar + " = bitcast %" + call.getExpr().getExprType() + "* " + callVar +
										" to %" + classMethodName + "*";
					methodCode.addBodyCode(castCode);
					firstArgs = this.processReturnType(classMethodName) + " " + castVar;
				}
			}
			else
			{
				firstArgs = this.processReturnType(scope.getClassScope().getClassType()) + " " +
						methodCode.getParamName(0);
				if(!classMethodName.equals(scope.getClassScope().getClassType()))
				{
					String castVar = this._buffer.getNextVariableName();
					String castCode = castVar + " = bitcast %" + scope.getClassScope().getClassType() + "* %self to %" +
										classMethodName + "*";
					methodCode.addBodyCode(castCode);
					firstArgs = this.processReturnType(classMethodName) + " " + castVar;
				}
			}
			
			String code = 	variableName + " = call " + this.processReturnType(returnType) + 
							" @" + classMethodName + "_" + call.getName() + "(" +
							firstArgs + ", ";

			int argCount = call.getArgs().size();
			for(int i = 0; i < argCount; i++)
			{
				String resultVarName = processMethodExpr(call.getArgs().get(i) , scope, methodCode);
				String paramType = method.getLocalField(method.getParams().get(i)).getType();
				String argType = call.getArgs().get(i).getExprType();
				String argName;
				if(!paramType.equals(argType))
				{
					argName = this._buffer.getNextVariableName();
					String castCode = argName + " = bitcast %" + argType + "* " + resultVarName + " to %" + paramType + "*";
					methodCode.addBodyCode(castCode);
				}
				else
				{
					argName = resultVarName;
				}
				code += this.processReturnType(paramType) + " " + argName + ", ";
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
			NewExpr newExpr = (NewExpr) expr;
			variableName = this._buffer.getNextVariableName();
			String code = variableName + " = call %" + newExpr.getExprType() + "* @_new" + newExpr.getExprType() + "()";
			methodCode.addBodyCode(code);
		}
		else if(expr instanceof UnaryExpr)
		{
			UnaryExpr unExpr = (UnaryExpr)expr;
			String valueVar = processMethodExpr(unExpr.getValue(), scope, methodCode);
			String code = null;
			
			switch(unExpr.getOp())
			{
				case ISVOID:
					if(unExpr.getValue().getExprType().equals("Int") || 
							unExpr.getValue().getExprType().equals("Bool"))
					{
						variableName = "" + 0;
					}
					else
					{
						variableName = this._buffer.getNextVariableName();
						code = variableName + " = icmp eq " + this.processReturnType(unExpr.getValue().getExprType())
												+ " null, " + valueVar;
						methodCode.addBodyCode(code);
					}
					
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
			CaseExpr caseExpr = (CaseExpr) expr;
			String valueVar = this.processMethodExpr(caseExpr.getValue(),scope , methodCode);
			String objectTypeVarPtr = this._buffer.getNextVariableName();
			String code = objectTypeVarPtr + " = getelementptr %" + caseExpr.getValue().getExprType() +
							"* " + valueVar + ", i32 0, i32 0";
			methodCode.addBodyCode(code);
			
			String objectTypeVar = this._buffer.getNextVariableName();
			code = objectTypeVar + " = bitcast i8** " + objectTypeVarPtr + " to i8*";
			methodCode.addBodyCode(code);
			
			//For que escribe los saltos según el tipo de objeto que es.
			String[][] caseLabelNames = this._buffer.getNextCaseNames(caseExpr.getCases());
			for(int i = 0; i < caseExpr.getCases().size(); i++)
			{
				//Vamos agregando la etiqueta anterior. La última etiqueta de los false va después del case
				if(i > 0)
				{
					methodCode.addBodyCode(caseLabelNames[1][i - 1] + ":");
				}
				String caseTypeVar = this._buffer.getNextVariableName();
				code = caseTypeVar + " = bitcast [" + (caseExpr.getCases().get(i).getType().length() + 1) + 
							" x i8]* @_type_" + caseExpr.getCases().get(i).getType() + " to i8*\n";
				methodCode.addBodyCode(code);
				
				String resultStrVar = this._buffer.getNextVariableName();
				code = resultStrVar + " = call i32 @strcmp(i8* " + objectTypeVar + ", i8* " + caseTypeVar + ")";
				methodCode.addBodyCode(code);
				
				String resultCmpVar = this._buffer.getNextVariableName();
				code = resultCmpVar + " = icmp eq i32 0, " + resultStrVar;
				methodCode.addBodyCode(code);
				
				code = "br i1 " + resultCmpVar + ", label %" + caseLabelNames[0][i] + ", label %" + caseLabelNames[1][i];
				methodCode.addBodyCode(code);
			}
			
			//Lista donde se guardarán las variables finales de procesar cada case
			List < String > finalVarsCase = new ArrayList < String >();
			//For donde se agrega el cuerpo de los case;
			for(int i = 0; i < caseExpr.getCases().size(); i++)
			{
				methodCode.addBodyCode(caseLabelNames[0][i] + ":");
				code = "%." + caseExpr.getCases().get(i).getType() + "." + caseExpr.getCases().get(i).getId() + 
						" = bitcast %" + caseExpr.getValue().getExprType() + "* " + valueVar + " to %" + 
						caseExpr.getCases().get(i).getType() + "*";
				methodCode.addBodyCode(code);
				
				String finalValVar = this.processMethodExpr(caseExpr.getCases().get(i).getValue(), 
						caseExpr.getCases().get(i).getScope(), methodCode);
				
				if(caseExpr.getExprType().equals(caseExpr.getCases().get(i).getValue().getExprType()))
				{
					finalVarsCase.add(finalValVar);
				}
				else
				{
					String finalVar = this._buffer.getNextVariableName();
					code = finalVar + " = bitcast %" + caseExpr.getCases().get(i).getValue().getExprType() + "* " +
							finalValVar + " to %" + caseExpr.getExprType() + "*";
					methodCode.addBodyCode(code);
					finalVarsCase.add(finalVar);
				}
				
				//Hacer un casteo a object, ya que todo debería guardarse en un object
				
				methodCode.addBodyCode("br label %" + caseLabelNames[2][0]);
			}

			methodCode.addBodyCode(caseLabelNames[1][caseExpr.getCases().size() - 1] + ":");
			String emptyVar = this._buffer.getNextVariableName();
			code = emptyVar + " = call %" + caseExpr.getExprType() + "* @_new" + caseExpr.getExprType() + "()";
			methodCode.addBodyCode(code);
			methodCode.addBodyCode("br label %" + caseLabelNames[2][0]);
			methodCode.addBodyCode(caseLabelNames[2][0] + ":");
			variableName = this._buffer.getNextVariableName();
			
			String phiCode = variableName + " = phi %" + caseExpr.getExprType() + "* ";
			//For donde va agregando las posibles condiciones del phi
			for(int i = 0; i < caseExpr.getCases().size(); i++)
			{
				phiCode += "[ " + finalVarsCase.get(i) + ", %" + caseLabelNames[0][i] + " ],";
			}
			
			//phiCode = phiCode.substring(0, phiCode.length() - 1);
			phiCode += "[ " + emptyVar + ", %" + caseLabelNames[1][caseExpr.getCases().size() - 1] + "]";
			methodCode.addBodyCode(phiCode);
			
			
		}
		else if(expr instanceof LetExpr)
		{
			LetExpr let = (LetExpr) expr;
			for(Variable var : let.getDecl())
			{
				String varType = this.processReturnType(var.getType());
				String allocateVar = "%_" +	methodCode.getClassType() + "_" + methodCode.getName() + "_"+ var.getId();
				if(!this._buffer.isIdInitialized(allocateVar, methodCode.getName()))
				{
					String allocateCode = allocateVar + " = alloca " + varType + ", align 4\n";
					methodCode.addBodyCode(allocateCode);
					this._buffer.addId(allocateVar, methodCode.getName());
				}
				
				if(var.getValue() != null)
				{
					String valueName = this.processMethodExpr(var.getValue(), let.getScope(), methodCode);
					
					variableName = valueName;
					String code = "store " + varType + " " + valueName + ", " + varType + "* " + allocateVar;
					methodCode.addBodyCode(code);
				}
				else
				{
					String code;
					if(var.getType().equals("Int") || var.getType().equals("Bool"))
					{
						code = "store " + varType + " 0, " + varType + "* " + allocateVar;
					}
					else if(var.getType().equals("String"))
					{
						code = "store " + varType + " getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0), " + 
									varType + "* " + allocateVar;
					}
					else
					{
						code = "store " + varType + " null, " + varType + "* " + allocateVar;
					}
					methodCode.addBodyCode(code);
				}
			}
			
			variableName = this.processMethodExpr(let.getValue(), let.getScope(), methodCode);
		}
		else if(expr instanceof IdExpr)
		{
			IdExpr id = (IdExpr)expr;
			Field field = scope.getField(id.getId());
			
			if(id.getId().equals("self"))
			{
				variableName = "%self";
			}
			else if(field.getParent() instanceof ClassScope)
			{
				String varPtr = this._buffer.getNextVariableName();
				String code = varPtr + " = getelementptr inbounds %" + field.getClassScope().getClassType() + 
							"* %self, i32 0, i32 " + 
							this._buffer.getAttributePosition(field.getClassScope().getClassType(), id.getId());
				methodCode.addBodyCode(code);
				
				variableName = this._buffer.getNextVariableName();
				code = variableName + " = load " + this.processReturnType(id.getExprType()) + "* " + varPtr;
				methodCode.addBodyCode(code);
			}
			else
			{
				String allocateVar = "%_" +	field.getClassScope().getClassType() + "_" + methodCode.getName() + "_"+ id.getId();
				if(!this._buffer.isIdInitialized(allocateVar, methodCode.getName()))
				{
					String allocateCode = allocateVar + " = alloca " + this.processReturnType(id.getExprType()) + ", align 4\n";
					methodCode.addBodyCode(allocateCode);
					this._buffer.addId(allocateVar, methodCode.getName());
				}
						
				variableName = this._buffer.getNextVariableName();
				String code = variableName + " = load  " + this.processReturnType(id.getExprType()) + "* %_" + 
							field.getClassScope().getClassType() + "_" + methodCode.getName() + "_"+ id.getId();
				methodCode.addBodyCode(code);
			}
		}
		else if(expr instanceof ValueExpr)
		{
			Object value = ((ValueExpr<?>)expr).getValue();
			
			if(value instanceof String)
			{
				ConstantStringCode constantCode = new ConstantStringCode((String)value);
				this._buffer.addConstantString(constantCode);
				
				variableName = this._buffer.getNextVariableName();
				String code = variableName + " = bitcast " + constantCode.getType() + " " + constantCode.getName() +
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