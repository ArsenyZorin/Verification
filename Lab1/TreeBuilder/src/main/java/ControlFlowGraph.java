import java.awt.*;
import java.util.*;
import java.util.List;
import javax.swing.*;

public class ControlFlowGraph{

    private List<ASTEntry> trees;
    private List<String> jumped;
    private List<List<GraphElement>> treeShapes = new ArrayList<>();
    private List<Block> blocks = new ArrayList<>();

    public ControlFlowGraph(List<ASTEntry> trees, List<String> jumped){
        this.trees = trees;
        this.jumped = jumped;

        getShapes();
    }

    private void getShapes(){
        for(ASTEntry tree: this.trees){
            List <GraphElement> nodeShapes = new ArrayList<>();
            for (ASTEntry node : tree.parent.children)
                if (node.nodeName.equals("IDENTIFIER")) {
                    nodeShapes.add(new GraphElement(node, ElementShape.ELLIPSE));
                    break;
                }

            for(ASTEntry node: tree.children) {
                if (node.nodeName.contains("CODE_BLOCK") ||
                        node.nodeName.contains("LBRACE") ||
                        node.nodeName.contains("RBRACE"))
                    continue;
                if (!isJumped(node)) {
                    nodeShapes.addAll(nonJumpedList(node));
                }
                else {
                    if("BINARY_EXPRESSION".equals(node.nodeName)) {
                        nodeShapes.add(new GraphElement(node, ElementShape.DIAMOND));
                        continue;
                    }
                    Block block = new Block(splitJumped(node));
                    nodeShapes.addAll(block.getBlock());
                    if(block.getBlock().size() != 0)
                        blocks.add(block);
                }
            }
            treeShapes.add(nodeShapes);
        }
    }

    private List<GraphElement> splitJumped(ASTEntry jumpedNode){
        List<GraphElement> nodeList = new ArrayList<>();
        for(ASTEntry node : jumpedNode.children) {
            if ("BLOCK_STATEMENT".equals(node.nodeName) || "CODE_BLOCK".equals(node.nodeName)) {
                nodeList.addAll(splitJumped(node));
                return nodeList;
            }
            if (!isJumped(node))
                nodeList.addAll(nonJumpedList(node));
            else {
                if("BINARY_EXPRESSION".equals(node.nodeName) || "CONTINUE_STATEMENT".equals(node.nodeName) || "BREAK_STATEMENT".equals(node.nodeName)){
                    nodeList.add(new GraphElement(node, ElementShape.DIAMOND));
                    continue;
                }
                Block block = new Block(splitJumped(node));
                nodeList.addAll(block.getBlock());
                if(block.getBlock().size() != 0)
                    blocks.add(block);
                nodeList.addAll(splitJumped(node));
            }
        }
        return nodeList;
    }

    private List<GraphElement> nonJumpedList(ASTEntry node){
        List<GraphElement> nodeList = new ArrayList<>();
        if("DECLARATION_STATEMENT".equals(node.nodeName)) {
            for (ASTEntry nodeChild : node.children)
                if ("LOCAL_VARIABLE".equals(nodeChild.nodeName) && nodeChild.children.size() > 1)
                    nodeList.add(new GraphElement(nodeChild, ElementShape.SQUARE));
        } else
            nodeList.add(new GraphElement(node, ElementShape.SQUARE));
        return nodeList;
    }

    private boolean isJumped(ASTEntry node){
        return jumped.contains(node.nodeName);
    }

    public void build(){

        Set<Integer> ids = new HashSet<>();

        /*for(Block block: blocks) {
            for (Block block1 : blocks) {
                if (blocks.indexOf(block) == blocks.indexOf(block1)) continue;
                if (block.equals(block1))
                    if (!ids.contains(blocks.indexOf(block)) ||
                            !ids.contains(blocks.indexOf(block1)))
                        ids.add(blocks.indexOf(block1));
            }
        }*/

        for (Block block : blocks){
            if (blocks.indexOf(block) == blocks.lastIndexOf(block)) continue;
            if(!ids.contains(blocks.indexOf(block)) ||
                    !ids.contains(blocks.lastIndexOf(block)))
                ids.add(blocks.lastIndexOf(block));
        }

        for(Integer id : ids)
            blocks.remove((int)id);
        
        for(Block block1 : blocks){
            for (Block block : blocks){
                if (block.getBlock().size() == 0) continue;
                if (blocks.indexOf(block) == blocks.indexOf(block1)) continue;
                while (block1.getNodes().containsAll(block.getNodes()))
                    block1.removeBlocks(block);
            }
        }

        for (Block block: blocks)
            block.refactor();

        BuildFigure cfg = new BuildFigure(treeShapes.get(0), blocks);
        cfg.paint();
    }
}
