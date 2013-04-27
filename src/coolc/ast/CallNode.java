package coolc.ast;

public class CallNode extends AstNode {

    private List<AstNode> args;
    private AstNode expr;
    private String type;

    private String id;
    
    public CallNode(String id, AstNode... args)
    {
        super("call");
        this.id = id;
        this.expr = null;
        this.type = "";
        for(AstNode node : args)
        	this.args.add(node);
    }

    public CallNode(AstNode expr, String id, AstNode... args)
    {
        super("call");
        this.id = id;
        this.expr = expr;
        this.type = "";
        for(AstNode node : args)
        	this.args.add(node);
    }

    public CallNode(AstNode expr, String id, String type, AstNode... args)
    {
        super("call");
        this.id = id;
        this.expr = expr;
        this.type = type;
        for(AstNode node : args)
        	this.args.add(node);
    }
    
    public String getId()
    {
        return this.id;
    }
    
    public AstNode getExpr()
    {
    	return this.expr;
    }
    
    public String getType()
    {
    	return this.type;
    }
    
    public AstNode getArgs()
    {
        return this.args;
    }
}
