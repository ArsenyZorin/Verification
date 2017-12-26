import java.util.*;

public class Block {
    private ASTEntry startsWith;
    private ASTEntry endsWith;
    private ASTEntry breakStmnt;
    private ASTEntry continueStmnt;
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

    public ASTEntry getEndsWith() {
        return endsWith;
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
        boolean found = false;
        GraphElement temp = null;
        ASTEntry cond = null;
        for (GraphElement node: block){
            if(found) break;
            if("WHILE_STATEMENT".equals(node.getNode().parent.nodeName)) {
                cond = node.getNode().getFirstDepthNode("IDENTIFIER");
                continue;
            }
            ASTEntry par = node.getNode().getParentByName("WHILE_STATEMENT");
            if (par != null){
                ASTEntry ident = node.getNode().getFirstDepthNode("IDENTIFIER");
                if (ident == null) continue;
                if (cond == null) continue;
                if (ident.text.equals(cond.text)) {
                    temp = node;
                    break;
                }
            }

            if(!"EXPRESSION_STATEMENT".equals(node.getNode().nodeName)) continue;
            for (ASTEntry childNode : node.getNode().children) {
                if ("POSTFIX_EXPRESSION".equals(childNode.nodeName) ||
                        "PREFIX_EXPRESSION".equals(childNode.nodeName))
                    if("FOR_STATEMENT".equals(childNode.parent.parent.nodeName)) {
                        temp = node;
                        found = true;
                        break;
                    }
            }
        }
        if(temp == null) return;

        block.remove(temp);
        block.add(temp);
        this.endsWith = temp.getNode();

        while(!block.get(0).getNode().equals(startsWith))
            block.remove(0);
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
                if (element.getNode().equals(element1.getNode())) {
                    if(!ids.contains(this.block.indexOf(element)))
                        ids.add(this.block.indexOf(element));
                }
            }
        Collections.reverse(ids);
        for (int id : ids)
            this.block.remove(id);
    }

    @Override
    public boolean equals(Object object) {
        if(object == null) return false;
        Block block = (Block) object;

        if(endsWith == null)
            return this.getNodes().equals(block.getNodes()) &&
                this.startsWith.equals(block.startsWith) &&
                this.isDrawn == block.isDrawn;
        else
            return this.getNodes().equals(block.getNodes()) &&
                    this.startsWith.equals(block.startsWith) &&
                    this.endsWith.equals(block.endsWith) &&
                    this.isDrawn == block.isDrawn;
    }
}
