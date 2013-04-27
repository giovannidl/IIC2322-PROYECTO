package coolc.ast;
import java.util.*;

public class ConditionalNode extends AstNode
{
    private AstNode cond;
    private AstNode is_true;
    private AstNode is_false;

    public ConditionalNode(AstNode cond, AstNode is_true, AstNode is_false)
    {
        super("condition");
        this.cond = cond;
        this.is_true = is_true;
        this.is_false = is_false;
    }
    
    public AstNode getCondition()
    {
    	return this.cond;
    }
    
    public AstNode getIsTrue()
    {
    	return this.is_true;
    }
    
    public AstNode getIsFalse()
    {
    	return this.is_false;
    }
}
