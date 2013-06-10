package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

public abstract class MethodCode 
{
	protected String _classType;
	protected String _name;
	protected String _lastVarType;
	
	protected List < String > _bodyCode;
	
	protected boolean _superCast;
	protected String _superVarNam;
	protected String _superClassType;
	
	public MethodCode(String name, String classType)
	{
		this._name = name;
		this._classType = classType;
		this._lastVarType = null;
		
		this._bodyCode = new ArrayList < String >();
		
		this._superCast = false;
		this._superVarNam = null;
		this._superClassType = null;
	}
	
	public void addBodyCode(String code)
	{
		this._bodyCode.add(code);
	}
	
	public String getName()
	{
		return "@" + this._classType + "_" + this._name;
	}
	
	public abstract String getCode();
	
	public abstract String getParamName(int pos);
	
	public String getSuperVarNam(String superClassType)
	{
		if(!this._superCast)
		{
			this._superVarNam = "%_superCast";
			this._superClassType = superClassType;
			this._superCast = true;
		}
		
		return this._superVarNam;
	}
	
	public String getLastVarType()
	{
		return this._lastVarType;
	}
	
	public void setLastVarType(String type)
	{
		this._lastVarType = type;
	}
}
