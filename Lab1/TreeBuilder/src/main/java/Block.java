import java.util.ArrayList;
import java.util.List;

public class Block {
    private ASTEntry startsWith;
    private List<GraphElement> block;
    private boolean isDrawn = false;

    public Block(List<GraphElement> block){
        this.block = block;
        findStartElem();
    }

    public void setDrawn(boolean isDrawn){
        this.isDrawn = isDrawn;
    }

    public boolean isDrawn(){
        return this.isDrawn;
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

    public void removeBlocks(List<GraphElement> removeBlock){
        this.block.removeAll(removeBlock);
    }
}
