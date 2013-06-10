package coolc.codegenerator;

public class InitializeMethodCode extends MethodCode
{
	public InitializeMethodCode(String name, String classType)
	{
		super("initializeAttributes", classType);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getCode()
	{
		String code = "define void @_" + this._classType + "_initializeAttributes" +
				"(%" + this._classType + "* %" + this._classType.toLowerCase().charAt(0) + ")\n";
		code += "{\n";
		
		if(this._superCast)
		{
			code += "\t" + this._superVarNam + " = bitcast %" + this._classType + "* %_" + 
					this._classType.toLowerCase().charAt(0) + " to %" + this._superClassType + "*\n";
		}
		
		for(String exprCode : this._bodyCode)
		{
			code += "\t" + exprCode + "\n";
		}
		
		code += "\tret void\n";
		code += "}\n";
		
		return code;
	}

	@Override
	public String getParamName(int pos)
	{
		return "%" + this._classType.toLowerCase().charAt(0);
	}
	
}
