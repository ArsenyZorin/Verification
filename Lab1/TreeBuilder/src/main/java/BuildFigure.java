import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Path2D;
import java.util.List;

public class BuildFigure extends JApplet {
    private List<GraphElement> elementList;

    public BuildFigure(List<GraphElement> elementList){
        this.elementList = elementList;
    }

    @Override
    public void paint(Graphics g) {
        Graphics2D g2 = (Graphics2D) g;

        Point start_with = new Point(150, 50);
        Point prev_elem_end = new Point(0, 0);

        g2.setPaint(Color.BLACK);

        for(GraphElement element : elementList) {
            if(ElementShape.ELLIPSE.equals(element.getElementShape())) {
                Ellipse2D ellipse = new Ellipse2D.Double(start_with.x, start_with.y, 150, 50);
                g2.drawString(element.getNode().text, (float) (ellipse.getCenterX() - ellipse.getCenterX() / 8), (float) ellipse.getCenterY());
                g2.draw(ellipse);
                prev_elem_end.setLocation(ellipse.getMaxX(), ellipse.getMaxY());
            }
            else if(ElementShape.SQUARE.equals(element.getElementShape())){
                Rectangle rectangle = new Rectangle(start_with.x, prev_elem_end.y + 50, 150, 50);
                g2.drawString(element.getNode().text, (float) (rectangle.getCenterX() - rectangle.getCenterX() / 8), (float) rectangle.getCenterY());
                g2.draw(rectangle);
                prev_elem_end.setLocation(rectangle.getMaxX(), rectangle.getMaxY());

            }
            else {
                Diamond diamond = new Diamond(start_with.x,  prev_elem_end.y + 50, 150, 50);
                int x = start_with.x;
                int y = prev_elem_end.y + 50;
                AffineTransform at = AffineTransform.getTranslateInstance(x, y);
                Shape shape = at.createTransformedShape(diamond);
                g2.drawString(element.getNode().text, (float) (diamond.getCenterX() - diamond.getCenterX() / 8), (float) diamond.getCenterY());
                prev_elem_end.setLocation(diamond.getMaxX(), diamond.getMaxY());
                g2.draw(shape);
            }

        }
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
