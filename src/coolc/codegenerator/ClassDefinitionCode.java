package coolc.codegenerator;

public class ClassDefinitionCode
{
	private String _classType;
	
	public ClassDefinitionCode (String classType)
	{
		this._classType = classType;
	}
	
	public String getClassCode()
	{
		return "%" + this._classType + " = type { i8* }";
	}
}
