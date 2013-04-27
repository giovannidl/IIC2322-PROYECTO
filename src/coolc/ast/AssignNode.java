package coolc.ast;
import java.util.*;

public class AssignNode extends AstNode
{
    private String id;

    public AssignNode(String id, AstNode... params)
    {
        super("assign", params);
        this.id = id;
    }
    
    public String getId()
    {
    	return this.id;
    }
}
