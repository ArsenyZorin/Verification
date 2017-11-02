import java.util.List;

public class Block {
    private ASTEntry startsWith;
    private List<GraphElement> block;

    public Block(List<GraphElement> block){
        this.block = block;
        findStartElem();
    }

    public ASTEntry getStartsWith() {
        return startsWith;
    }

    public List<GraphElement> getBlock() {
        return block;
    }

    private void findStartElem(){
        for (GraphElement element : block){
            if(ElementShape.DIAMOND.equals(element.getElementShape())){
                startsWith = element.getNode();
                return;
            }
        }
    }
}
