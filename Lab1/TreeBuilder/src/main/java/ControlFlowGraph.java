import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;

public class ControlFlowGraph{

    private List<ASTEntry> trees;
    private List<String> jumped;
    private List<List<GraphElement>> treeShapes = new ArrayList<>();
    private static final String METHOD_TOKEN = "METHOD";

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
                    nodeShapes.addAll(splitJumped(node));
                }
            }
            treeShapes.add(nodeShapes);
        }
    }

    private List<GraphElement> splitJumped(ASTEntry jumpedNode){
        List<GraphElement> nodeList = new ArrayList<>();
        for(ASTEntry node : jumpedNode.children) {
            if ("BLOCK_STATEMENT".equals(node.nodeName)) {
                nodeList.addAll(splitJumped(node));
                return nodeList;
            }

            if("CODE_BLOCK".equals(node.nodeName)){
                for (ASTEntry nodeChild : node.children)
                    if(!isJumped(nodeChild)) {
                        nodeList.add(new GraphElement(nodeChild, ElementShape.SQUARE));
                    }
                    else
                        splitJumped(nodeChild);
                return nodeList;
            }

            if (!isJumped(node))
                nodeList.addAll(nonJumpedList(node));
            else {
                if("BINARY_EXPRESSION".equals(node.nodeName)){
                    nodeList.add(new GraphElement(node, ElementShape.DIAMOND));
                    continue;
                }
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
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        JApplet applet = new BuildFigure(treeShapes.get(0));

        frame.getContentPane().add(applet);
        frame.pack();
        frame.setSize(new Dimension(400, 400));
        frame.setVisible(true);
    }

}
