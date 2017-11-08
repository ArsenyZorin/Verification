import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Block {
    private ASTEntry startsWith;
    private ASTEntry endsWith;
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
        boolean found = false;
        for (GraphElement node: block){
            if(found) break;
            if(!"EXPRESSION_STATEMENT".equals(node.getNode().nodeName)) continue;
            for (ASTEntry childNode : node.getNode().children) {
                if ("POSTFIX_EXPRESSION".equals(childNode.nodeName))
                    if("FOR_STATEMENT".equals(childNode.parent.parent.nodeName)) {
                        index = block.indexOf(node);
                        found = true;
                        break;
                    }
            }
        }
        if(index == -1) return;

        GraphElement temp = block.get(index);
        block.remove(temp);
        block.add(temp);
        this.endsWith = temp.getNode();
    }

    public List<ASTEntry> getNodes(){
        List<ASTEntry> nodes = new ArrayList<>();
        for (GraphElement element : block)
            nodes.add(element.getNode());
        return nodes;
    }

    public void removeBlocks(Block removeBlock) {
        this.block.removeAll(removeBlock.getBlock());

        List<Integer> ids = new ArrayList<>();
        for (GraphElement element1 : removeBlock.getBlock())
            for (GraphElement element : this.block) {
                if (element.getNode().equals(removeBlock.getStartsWith())) continue;
                if (element.getNode().equals(element1.getNode()))
                    ids.add(this.block.indexOf(element));
            }
        Collections.reverse(ids);
        for (int id : ids)
            this.block.remove(id);
    }
}
