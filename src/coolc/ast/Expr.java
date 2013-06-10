package coolc.ast;


public abstract class Expr extends Node
{
    private String _type;

    public String getExprType()
    {
        return _type;
    }

    public void setExprType(String value)
    {
        _type = value;
    }
    
}