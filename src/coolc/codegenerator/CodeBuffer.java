package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

public class CodeBuffer
{
	//Top Buffer
	private String _defaultClasses;
	private String _defaultGlobalVariables;
	private List < ClassDefinitionCode > _classDefinitions;
	private List < ConstantStringCode > _constantStrings;
	private List < AttributeCode > _attributes;
	
	//Mid Buffer
	private String _mainDefinition;
	private List < MethodCode > _initializeMethods;
	private List < MethodCode > _defineMethods;
	
	//Bot Buffer
	private List <DeclareFunctionCode > _declareFunctions;
	
	private int _variableNum;
	private int _condNum;
	
	public CodeBuffer()
	{	
		this._classDefinitions = new ArrayList < ClassDefinitionCode >();
		this._constantStrings = new ArrayList < ConstantStringCode >();
		this._attributes = new ArrayList< AttributeCode > ();
		
		this._initializeMethods = new ArrayList < MethodCode >();
		this._defineMethods = new ArrayList < MethodCode >();
		
		this._declareFunctions = new ArrayList < DeclareFunctionCode >();
		
		this.createAllDeclareFunctions();
		this.defineDefaultClasses();
		this.defineDefaultGlobalVariables();
		this.defineMain();
		
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
	
	public void addAttribute(AttributeCode code)
	{
		this._attributes.add(code);
	}
	
	public void addInitializeMethod(MethodCode code)
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
		String code = 	this._defaultClasses + "\n";
		
		for(ClassDefinitionCode classCode : this._classDefinitions)
		{
			code += classCode.getClassCode() + "\n";
		}
		
		code += "\n" + this._defaultGlobalVariables + "\n";
		
		for(AttributeCode attrCode : this._attributes)
		{
			code += attrCode.getCode() + "\n";
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
	}
	
	private void defineDefaultGlobalVariables()
	{
		this._defaultGlobalVariables = "@.empty_str = private unnamed_addr constant [1 x i8] c\"\\00\"";
	}
	
	private void defineDefaultClasses()
	{
		this._defaultClasses = 	"%Object = type { i8* }\n" +
								"%IO = type { i8* }";
	}
	
	private void defineMain()
	{
		this._mainDefinition = 	"define i32 @main()\n{\n" + 
								"\tcall void @_Main_initializeAttributes(%Main* null)\n" +
								"\tcall %Object* @Main_main(%Main* null)\n" +
								"\tret i32 0\n" +
								"}\n";	
	}
}
