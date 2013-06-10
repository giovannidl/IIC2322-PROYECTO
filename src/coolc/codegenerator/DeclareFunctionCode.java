package coolc.codegenerator;


public class DeclareFunctionCode
{
	private String _returnType;
	private String _functionName;
	private String[] _params;
	
	public DeclareFunctionCode(String functionName, String returnType, String[] params)
	{
		this._functionName = functionName;
		this._returnType = returnType;
		this._params = params;
	}
	
	public String getCode()
	{
		String code = "declare " + this._returnType + " @" + this._functionName + "(";
		
		if(this._params.length != 0)
		{
			code += this._params[0];
			for(int i = 1; i < _params.length; i++)
			{
				code += ", " + this._params[i];
			}
		}
		
		return code + ")";
	}
	
	public String getName()
	{
		return this._functionName;
	}
}
