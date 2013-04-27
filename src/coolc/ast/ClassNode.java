package coolc.ast;
import java.util.*;

public class ClassNode extends AstNode
{
    private String father;
    private String type;

    public ClassNode(String type, AstNode... params)
    {
        super("class", params);
        this.type = type;
        this.father = "";
    }

    public ClassNode(String type, String father, AstNode... params)
    {
        super("class", params);
		this.type = type;
		this.father = father;
    }
    
    public String getType()
    {
    	return this.type;
    }
    
    public String getFather()
    {
    	return this.father;
    }
}
