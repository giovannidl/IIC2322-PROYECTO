package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

import coolc.ast.Case;

public class CodeBuffer
{
	//Top Buffer
	private String _defaultGlobalVariables;
	private List < ClassDefinitionCode > _classDefinitions;
	private List < ConstantStringCode > _constantStrings;
	
	//Mid Buffer
	private String _mainDefinition;
	private List < InitializeMethodCode > _initializeMethods;
	private List < MethodCode > _defineMethods;
	
	//Bot Buffer
	private List <DeclareFunctionCode > _declareFunctions;
	
	//La clase que contiene al main
	private String[] _mainClass;
	
	//Contadores del buffer
	private int _variableNum;
	private int _condNum;
	private int _caseNum;
	
	public CodeBuffer()
	{	
		this._classDefinitions = new ArrayList < ClassDefinitionCode >();
		this._constantStrings = new ArrayList < ConstantStringCode >();
		
		this._initializeMethods = new ArrayList < InitializeMethodCode >();
		this._defineMethods = new ArrayList < MethodCode >();
		
		this._declareFunctions = new ArrayList < DeclareFunctionCode >();
		
		this._mainClass = new String[2];
		
		this.createAllDeclareFunctions();
		this.defineDefaultClasses();
		this.defineDefaultGlobalVariables();
		
		this._variableNum = 0;
		this._condNum = 0;
	};
	
	public void addClassDefinition(ClassDefinitionCode code)
	{
		this._classDefinitions.add(code);
	}
	
	public void addConstantString(ConstantStringCode code)
	{
		this._constantStrings.add(code);
	}
	
	public void addInitializeMethod(InitializeMethodCode code)
	{
		this._initializeMethods.add(code);
	}
	
	public void addDefineMethod(MethodCode code)
	{
		this._defineMethods.add(code);
	}
	
	public void addDeclareFunction(DeclareFunctionCode code)
	{
		this._declareFunctions.add(code);
	}
	
	public String getPrintableCode()
	{
		//Antes de generar el código, genero el main
		this.defineMain();
		
		String code = "";
		
		for(ClassDefinitionCode classCode : this._classDefinitions)
		{
			code += classCode.getClassCode() + "\n";
		}
		
		code += "\n" + this._defaultGlobalVariables + "\n";
		
		for(ClassDefinitionCode classCode : this._classDefinitions)
		{
			code += classCode.getNameCode() + "\n";
		}
		
		for(ConstantStringCode stringCode : this._constantStrings)
		{
			code += stringCode.getCode() + "\n";
		}
		
		//Agregamos una linea para separar la definición de métodos
		code += "\n";
		code += this._mainDefinition + "\n";
		
		for(MethodCode methodCode : this._initializeMethods)
		{
			code += methodCode.getCode() + "\n\n";
		}
		
		for(MethodCode methodCode : this._defineMethods)
		{
			code += methodCode.getCode() + "\n\n";
		}
		
		//Agregamos una linea para separar la declaración de funciones externas
		code += "\n";
		
		for(DeclareFunctionCode functionCode : this._declareFunctions)
		{
			code += functionCode.getCode() + "\n";
		}
		
		return code;
	}
	
	public String getNextVariableName()
	{
		return "%_var" + this._variableNum++;
	}
	
	public String[] getNextConditionNames()
	{
		return new String[] 
				{ 
					"cond_true" + this._condNum, 
					"cond_false" + this._condNum,
					"cond_next" + this._condNum++
				};
	}
	
	public String[][] getNextCaseNames(List < Case > caseExprs)
	{
		String[][] names = new String[3][caseExprs.size()];
		for(int i = 0; i < caseExprs.size(); i++)
		{
			names[0][i] = caseExprs.get(i).getType() + this._caseNum;
			names[1][i] = "FalseJump" + this._caseNum + "_" + i;
		}
		names[2] = new String[] { "final_case" + this._caseNum };
		this._caseNum++;
		return names;
	}
	
	public ClassDefinitionCode getClassDefCode(String type)
	{
		for(ClassDefinitionCode classCode : this._classDefinitions)
		{
			if(classCode.getClassType().equals(type))
				return classCode;
		}
		
		return null;
	}
	
	public InitializeMethodCode getClassInitCode(String type)
	{
		for(InitializeMethodCode initMethCode : this._initializeMethods)
		{
			if(initMethCode.getClassType().equals(type))
				return initMethCode;
		}
		
		return null;
	}
	
	public int getAttributePosition(String classType, String attrId)
	{
		for(ClassDefinitionCode classCode : this._classDefinitions)
		{
			if(classCode.getClassType().equals(classType))
			{
				return classCode.getAttributePosition(attrId);
			}
		}
		
		return -1;
	}
	
	public void setMainClass(String classType, String returnType)
	{
		this._mainClass[0] = classType;
		this._mainClass[1] = returnType;
	}
	
	private void createAllDeclareFunctions()
	{
		this._declareFunctions.add(new DeclareFunctionCode("Object_abort", "%Object*", new String[]{"%Object*"}));
		this._declareFunctions.add(new DeclareFunctionCode("Object_type_name", "i8*", new String[]{"%Object*"}));
		this._declareFunctions.add(new DeclareFunctionCode("IO_out_string", "%IO*", new String[] {"%IO*", "i8*"}));
		this._declareFunctions.add(new DeclareFunctionCode("IO_in_string", "i8*", new String[] {"%IO*"}));
		this._declareFunctions.add(new DeclareFunctionCode("IO_out_int", "%IO*", new String[] {"%IO*", "i32"}));
		this._declareFunctions.add(new DeclareFunctionCode("IO_in_int", "i32", new String[] {"%IO*"}));
		this._declareFunctions.add(new DeclareFunctionCode("String_length", "i32", new String[]{"i8*"}));
		this._declareFunctions.add(new DeclareFunctionCode("String_concat", "i8*", new String[]{"i8*", "i8*"}));
		this._declareFunctions.add(new DeclareFunctionCode("String_substr", "i8*", new String[]{"i8*", "i32", "i32"}));
		this._declareFunctions.add(new DeclareFunctionCode("strcmp", "i32", new String[]{ "i8*", "i8*"}));
		this._declareFunctions.add(new DeclareFunctionCode("malloc", "i8*", new String[]{ "i64"}));
	}
	
	private void defineDefaultGlobalVariables()
	{
		this._defaultGlobalVariables = "@.empty_str = private unnamed_addr constant [1 x i8] c\"\\00\"";
	}
	
	private void defineDefaultClasses()
	{	
		this._classDefinitions.add(new ClassDefinitionCode("Object"));
		this._classDefinitions.add(new ClassDefinitionCode("IO"));
		this._initializeMethods.add(new InitializeMethodCode("IO"));
	}
	
	private void defineMain()
	{
		this._mainDefinition = 	"define i32 @main()\n{\n" + 
								"\t%mainClass = call %" + this._mainClass[0] + "* @_new" + this._mainClass[0] +"()\n" +
								"\tcall %" + this._mainClass[1] + "* @" + this._mainClass[0] + "_main(%" + this._mainClass[0] +  "* %mainClass)\n" +
								"\tret i32 0\n" +
								"}\n";	
	}
}
