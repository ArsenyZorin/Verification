public class GraphElement {
    private ASTEntry node;
    private ElementShape elementShape;

    public GraphElement(ASTEntry node, ElementShape elementShape){
        this.node = node;
        this.elementShape = elementShape;
    }

    public ASTEntry getNode() {
        return node;
    }

    public ElementShape getElementShape() {
        return elementShape;
    }
}