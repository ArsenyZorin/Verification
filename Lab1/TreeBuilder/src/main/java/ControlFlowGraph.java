import com.intellij.lang.ASTNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.swing.JFrame;

public class ControlFlowGraph{

    private enum Shape{
        ELIPSE,
        SQUARE,
        DIAMOND
    }
    private List<ASTEntry> trees;
    private List<String> jumped;
    private List<HashMap <ASTEntry, Shape>> treeShapes = new ArrayList<>();
    private static final String METHOD_TOKEN = "METHOD";

    public ControlFlowGraph(List<ASTEntry> trees, List<String> jumped){
        this.trees = trees;
        this.jumped = jumped;

        getShapes();
    }

    private void getShapes(){
        for(ASTEntry tree: this.trees){
            HashMap <ASTEntry,Shape> nodeShapes = new HashMap<>();
            for(ASTEntry node: tree.children) {
                if (node.nodeName.contains("CODE_BLOCK") ||
                        node.nodeName.contains("LBRACE") ||
                        node.nodeName.contains("RBRACE"))
                    continue;
                if (!isJumped(node))
                    nodeShapes.put(node, Shape.SQUARE);
                else
                    nodeShapes.put(node, Shape.DIAMOND);
            }
            treeShapes.add(nodeShapes);
        }
    }

    private boolean isJumped(ASTEntry node){
        return jumped.contains(node.nodeName);
    }

    public void build(){
        HelloWorld frame = new HelloWorld();
        frame.view();
    }

}
