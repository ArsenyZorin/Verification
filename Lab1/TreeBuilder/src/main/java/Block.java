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

    public void refactor(){
        int index = -1;
        for (GraphElement node: block){
            for (ASTEntry childNode : node.getNode().children) {
                if ("POSTFIX_EXPRESSION".equals(childNode.nodeName))
                    if("FOR_STATEMENT".equals(childNode.parent.parent.nodeName)) {
                        index = block.indexOf(node);
                        break;
                    }
            }
        }
        if(index == -1) return;

        GraphElement temp = block.get(index);
        block.remove(temp);
        block.add(temp);
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
