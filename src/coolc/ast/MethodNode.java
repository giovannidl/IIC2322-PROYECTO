package coolc.ast;
import java.util.*;

public class MethodNode extends AstNode
{
    private String type;
    private String id;
    private List<FormalNode> params;

    public MethodNode(String id, String type, AstNode... nodes)
    {
        super("method", nodes);
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
    
    public List<FormalNode> getParams()
    {
    	return this.params;
    }
    
    public void setParams(List<FormalNode> params)
    {
    	for(FormalNode node : params)
        {
        	this.params.add(node);
        }
    }
}
