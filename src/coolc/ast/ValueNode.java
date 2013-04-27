package coolc.ast;


public class ValueNode extends AstNode {

    private Object value;
    public Object getValue() {
        return value;
    }

    public ValueNode(String tag, Object value) {
        super(tag);
        this.value = value;
    }    

}