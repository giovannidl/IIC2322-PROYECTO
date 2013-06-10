package coolc.codegenerator;

public class AttributeCode
{
	private String _id;
	private String _type;
	private String _value;
	private String _classType;
	
	public AttributeCode(String id, String type, String classType)
	{
		this._id = id;
		this._type = type;
		this._value = this.getDefaultValue(type);
		this._classType = classType;
	}
	
	public String getCode()
	{
		return this.getName() + " = global " + this._type + " " + this._value;
	}
	
	public String getName()
	{
		return "@_" + this._classType + "_" + this._id;
	}
	
	private String getDefaultValue(String type)
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
			return null;
		}
	}
}
