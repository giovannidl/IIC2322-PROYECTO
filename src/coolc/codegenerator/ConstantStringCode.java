package coolc.codegenerator;

public class ConstantStringCode
{
	private static int _count = 0;
	private String _text;
	private int _number;
	private int _lenght;
	private String _getType;
	
	public ConstantStringCode(String text)
	{
		this._text = text.replace("\n", "\\0A").replace("\f", "\\0C").replace("\t", "\\09").replace("\b", "\\08");
		this._lenght = text.length() + 1;
		this._number = _count;
		this._getType = "[" + this._lenght + " x i8]*";
		_count++;
	}
	
	public String getCode()
	{
		return "@_string_" + this._number + " = internal constant [" + this._lenght + " x i8] c\"" +
				this._text + "\\00\"";
	}
	
	public String getName()
	{
		return "@_string_" + this._number;
	}
	
	public String getType()
	{
		return this._getType;
	}
	
}
