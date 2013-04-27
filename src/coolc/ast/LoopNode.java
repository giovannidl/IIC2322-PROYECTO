package coolc.ast;
import java.util.*;

public class LoopNode extends AstNode
{
    private AstNode cond;
    private AstNode expr;

    public LoopNode(AstNode cond, AstNode expr)
    {
        super("loop");
        this.cond = cond;
        this.expr = expr;
    }
    
    public AstNode getCondition()
    {
    	return this.cond;
    }
    
    public AstNode getexpr()
    {
    	return this.expr;
    }
}
