package coolc.ast;
import java.util.*;

public class AstNode {

    public List<AstNode> children;
    public String tag;

    public AstNode(String tag) {
        this.tag = tag;
        children = new ArrayList<AstNode>();
    }    

    public AstNode(String tag,  AstNode... params) {
        this(tag);
        for(AstNode o: params) {
            children.add(o);
        }
    }
}