

import javax.swing.*;
import java.awt.*;

public class GraphElement {
    private ASTEntry node;
    private Shape shape;

    public GraphElement(ASTEntry node, Shape shape){
        this.node = node;
        this.shape = shape;
    }

    public ASTEntry getNode() {
        return node;
    }

    public Shape getShape() {
        return shape;
    }
}