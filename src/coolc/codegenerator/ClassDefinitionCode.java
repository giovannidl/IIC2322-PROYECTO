package coolc.codegenerator;

import java.util.ArrayList;
import java.util.List;

public class ClassDefinitionCode
{
	private String _classType;
	private List < String > _attrTypes;
	private List < String > _attrIds;
	
	public ClassDefinitionCode (String classType)
	{
		this._classType = classType;
		this._attrTypes = new ArrayList < String >();
		this._attrIds = new ArrayList < String >();
	}
	
	public ClassDefinitionCode (String classType, ClassDefinitionCode superClassCode)
	{
		this(classType);
		
		for(int i = 0; i < superClassCode._attrTypes.size(); i++)
		{
			this._attrTypes.add(superClassCode._attrTypes.get(i));
			this._attrIds.add(superClassCode._attrIds.get(i));
		}
	}
	
	public String getClassCode()
	{
		String code = "%" + this._classType + " = type { i8*";
		for(String attrType : this._attrTypes)
		{
			code += ", " + attrType;
		}
		code += "}";
		return code;
	}
	
	public String getNameCode()
	{
		return "@_type_" + this._classType + " = internal constant [" + (this._classType.length() + 1) + " x i8] c\"" +
				this._classType + "\\00\"";
	}
	
	public void addAttrType(String type, String id)
	{
		this._attrTypes.add(type);
		this._attrIds.add(id);
	}
	
	public String getClassType()
	{
		return this._classType;
	}
	
	public int getAttributePosition(String id)
	{
		//Se devuelve más uno, ya que el primer atributo siempre es el tipo
		return this._attrIds.indexOf(id) + 1;
	}
}
