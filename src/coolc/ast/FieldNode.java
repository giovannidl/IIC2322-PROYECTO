package coolc.ast;
import java.util.*;

public class FieldNode extends AstNode
{
    private String type;
    private String id;

    public FieldNode(String id, String type, AstNode... params)
    {
        super("field", params);
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
