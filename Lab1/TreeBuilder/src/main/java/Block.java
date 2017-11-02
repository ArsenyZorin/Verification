import java.util.ArrayList;
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

    public List<ASTEntry> getNodes(){
        List<ASTEntry> nodes = new ArrayList<>();
        for (GraphElement element : block)
            nodes.add(element.getNode());
        return nodes;
    }
}
