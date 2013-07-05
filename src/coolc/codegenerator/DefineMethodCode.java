package coolc.codegenerator;

import java.util.List;

public class DefineMethodCode extends MethodCode
{
	private List < String[] > _params;
	private String _returnType;
	private String _returnVariable;

	//List < ExprCode > body;
	
	public DefineMethodCode(String name, String classType, String returnType, List < String[] > params)
	{
		super(name, classType);
		this._returnType = returnType;
		this._params = params;
	}
	
	@Override
	public String getCode()
	{
		String code = "define " + this._returnType + " @" + this._classType + "_" + this._name + "(";
		code += "%" + this._classType + "* %self";
		if(!this._params.isEmpty())
		{
			for(String[] param : this._params)
			{
				code += ", " + param[0];
				if(param[1] != null)
				{
					code += " %." + this._classType + "." + param[1];
					//TODO Falta ver los parametros inicializados
				}
			}
		}
		
		code += ")\n{\n";
		
		for(String exprCode : this._bodyCode)
		{
			code += "\t" + exprCode + "\n";
		}
		
		code += "\tret " + this._returnType + " " + this._returnVariable + "\n";
		
		return code + "}\n";
	}
	
	@Override
	public String getParamName(int num)
	{
		if(num == 0)
			return "%self";
		else
			return "%." + this._classType + "." + this._params.get(num - 1)[1];
	}
	
	public String getReturnVariable()
	{
		return this._returnVariable;
	}
	
	public void setReturnVariable(String returnVariable)
	{
		this._returnVariable = returnVariable;
	}
}
