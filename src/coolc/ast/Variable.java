package coolc.ast;

public class Variable extends Feature
{
    private String _id;
    private String _type;
    private Expr _value;

    public Variable(String id, String type, Expr value)
    {
        _id = id;
        _type = type;
        _value = value;
    }

    public Variable(String id, String type)
    {
        this(id, type, null);
    }
    
    public String getId()
    {
        return _id;
    }

    public String getType()
    {
        return _type;
    }

    public Expr getValue()
    {
        return _value;
    }
}
