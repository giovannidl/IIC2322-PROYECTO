package coolc.ast;
import java.util.*;

public class FormalNode extends AstNode
{
    private String type;
    private String id;

    public FormalNode(String id, String type, AstNode... params)
    {
        super("formal", params);
        this.id = id;
        this.type = type;
    }
    
    public String getId()
    {
    	return this.id;
    }
    
    public String getType()
    {
    	return this.type;
    }
}
