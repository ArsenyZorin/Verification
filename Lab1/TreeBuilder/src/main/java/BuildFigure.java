import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Path2D;
import java.util.List;

public class BuildFigure extends JPanel {
    private List<GraphElement> elementList;
    private List<Block> blocks;
    private int width = 150;
    private int height = 50;

    public BuildFigure(List<GraphElement> elementList, List<Block> blocks){
        this.elementList = elementList;
        this.blocks = blocks;
    }

    @Override
    public void paint(Graphics g) {
        Graphics2D g2 = (Graphics2D) g;

        Point start_with = new Point(width, height);
        Point prev_elem_end = new Point(0, 0);
        Point block_elem = new Point(0, 0);

        g2.setPaint(Color.BLACK);

        for(GraphElement element : elementList) {
            if(ElementShape.ELLIPSE.equals(element.getElementShape())) {
                Ellipse2D ellipse = new Ellipse2D.Double(start_with.x, start_with.y, width, height);
                g2.drawString(element.getNode().text, (float) (ellipse.getCenterX() - ellipse.getCenterX() / 8), (float) ellipse.getCenterY());
                g2.draw(ellipse);
                prev_elem_end.setLocation(ellipse.getMaxX(), ellipse.getMaxY() + 50);
            }
            else if(ElementShape.SQUARE.equals(element.getElementShape())){
                if(inBlock(element.getNode()))
                    continue;

                int x = start_with.x;
                int y = prev_elem_end.y;

                prev_elem_end = drawSquare(g2, new Point(x, y), element.getNode().text);

            }
            else {
                Block block = getBlockWithStart(element.getNode());
                if(block == null) continue;
                if(block.isDrawn()) continue;

                int x = start_with.x;
                int y = prev_elem_end.y;

                prev_elem_end = drawDiamond(g2, new Point(x, y), element.getNode().text);

                block_elem.setLocation(start_with.x + 2 * width, y);
                blocks.get(blocks.indexOf(block)).setDrawn(true);
                drawBlock(g2, blocks.indexOf(block), block.getNodes().indexOf(block.getStartsWith()), block_elem);
            }
        }
    }

    private Point drawDiamond(Graphics2D g2, Point drawPoint, String text){
        Diamond diamond = new Diamond(drawPoint.x,  drawPoint.y, width, height);
        AffineTransform at = AffineTransform.getTranslateInstance(drawPoint.x, drawPoint.y);
        Shape shape = at.createTransformedShape(diamond);
        g2.drawString(text, (float) (diamond.getCenterX() - diamond.getCenterX() / 12), (float) diamond.getCenterY());
        g2.draw(shape);
        return new Point((int)diamond.getMaxX(), (int)diamond.getMaxY() + 50);
    }

    private Point drawSquare(Graphics2D g2, Point drawPoint, String text){
        Rectangle rectangle = new Rectangle(drawPoint.x, drawPoint.y, width, height);
        g2.drawString(text, (float) (rectangle.getCenterX() - rectangle.getCenterX() / 8), (float) rectangle.getCenterY());
        g2.draw(rectangle);
        return new Point((int)rectangle.getX(), (int)rectangle.getMaxY() + 50);
    }

    private void drawBlock(Graphics2D g2, int listIndex, int nodeIndex, Point drawPoint){
        List<GraphElement> blockElems = blocks.get(listIndex).getBlock();
        for(int i = nodeIndex + 1; i < blockElems.size(); i++){
            if(ElementShape.SQUARE.equals(blockElems.get(i).getElementShape()))
                drawPoint = drawSquare(g2, drawPoint, blockElems.get(i).getNode().text);
            else if(ElementShape.DIAMOND.equals(blockElems.get(i).getElementShape())) {
                drawPoint = drawDiamond(g2, drawPoint, blockElems.get(i).getNode().text);
                drawPoint.setLocation(drawPoint.x + 2 * width, drawPoint.y);
                Block block = getBlockWithStart(blockElems.get(i).getNode());
                blocks.get(blocks.indexOf(block)).setDrawn(true);
                drawBlock(g2, blocks.indexOf(block), block.getNodes().indexOf(block.getStartsWith()), drawPoint);
            }
        }
    }

    private Block getBlockWithStart(ASTEntry startsWith){
        for(Block block: blocks)
            if(block.getStartsWith().equals(startsWith))
                return block;
        return null;
    }

    private boolean inBlock(ASTEntry elem){
        for(Block block : blocks){
            if(block.getNodes().contains(elem))
                return true;
        }
        return false;
    }

    public class Diamond extends Path2D.Double{

        private int x;
        private int y;
        private double width;
        private double height;

        public Diamond(int x, int y, double width, double height){
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            create();
        }

        private void create(){
            moveTo(0, height / 2);
            lineTo(width / 2, 0);
            lineTo(width, height / 2);
            lineTo(width / 2, height);
            closePath();
        }

        public double getMaxX() {
            return this.x + this.width;
        }

        public double getMaxY() {
            return this.y + this.height;
        }

        public double getCenterX() {
            return this.x + this.width / 2.0D;
        }

        public double getCenterY() {
            return this.y + this.height / 2.0D;
        }
    }
}
