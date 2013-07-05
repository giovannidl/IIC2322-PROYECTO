package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

public class InitializeMethodCode extends MethodCode
{
	private List < String > _attributePointersCode;
	
	public InitializeMethodCode(String classType)
	{
		super("initializeAttributes", classType);
		this._attributePointersCode = new ArrayList < String >();
	}
	
	public InitializeMethodCode(String classType, InitializeMethodCode parentInitializer)
	{
		this(classType);
		this._bodyCode.addAll(parentInitializer._bodyCode);
		
		//Se copian los códigos que obtienen el puntero reemplazando el nombre de la clase padre por el hijo
		for(String attrCode : parentInitializer._attributePointersCode)
		{
			this._attributePointersCode.add(attrCode.replaceAll(parentInitializer._classType, classType));
		}
	}
	
	public void addAttributePointerCode(String code)
	{
		this._attributePointersCode.add(code);
	}

	@Override
	public String getCode()
	{
		String code = "define %" + this._classType +"* @_new" + this._classType + "()\n";
		
		code += "{\n";
		
		code += "\t%vptr = call i8* @malloc(i64 ptrtoint (%" + this._classType + "* getelementptr" +
				" (%" + this._classType + "* null , i32 1) to i64))\n";
		
		code += "\t%self = bitcast i8* %vptr to %" + this._classType + "*\n";
		code += "\t%class_type = getelementptr %" + this._classType + "* %self, i32 0, i32 0\n";
		code += "\tstore i8* bitcast([" + (this._classType.length() + 1) + " x i8]* @_type_" + this._classType +
				" to i8*), i8** %class_type\n";
		
		//Separamos la parte genérica
		code += "\n";
		
		if(this._superCast)
		{
			code += "\t" + this._superVarNam + " = bitcast %" + this._classType + "* %_" + 
					this._classType.toLowerCase().charAt(0) + " to %" + this._superClassType + "*\n";
		}
		
		//Antes de llamar al cuerpo del método, llamamos a las variables que piden los punteros
		for(String ptrCode : this._attributePointersCode)
		{
			code += "\t" + ptrCode + "\n";
		}
		
		for(String exprCode : this._bodyCode)
		{
			code += "\t" + exprCode + "\n";
		}
		
		code += "\tret %" + this._classType + "* %self\n";
		code += "}\n";
		
		return code;
	}

	@Override
	public String getParamName(int pos)
	{
		return "%" + this._classType.toLowerCase().charAt(0);
	}
	
	public String getDefaultValue(String type)
	{
		switch(type)
		{
		case "i8*":
			return "getelementptr inbounds ([1 x i8]* @.empty_str, i64 0, i64 0)";
		case "i32":
			return "0";
		case "i1":
			return "0";
		default:
			return "void";
		}
	}
	
}
