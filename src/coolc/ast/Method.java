package coolc.ast;

import coolc.infrastructure.*;

public class Method extends Feature
{
    private String _name;
    private DeclList _params;
    private String _type;
    private Expr _body;
    private Scope _scope;

    public Method(String name, DeclList params, String type, Expr body)
    {
        _name = name;
        _params = params;
        _type = type;
        _body = body;
    }
    
    public String getName()
    {
        return _name;
    }

    public DeclList getParams()
    {
        return _params;
    }

    public String getType()
    {
        return _type;
    }

    public Expr getBody()
    {
        return _body;
    }

    public Scope getScope()
    {
        return _scope;
    }
    
    public void setScope(Scope scope)
    {
        _scope = scope;
    }
}