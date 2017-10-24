import javax.swing.*;
import java.awt.*;
import java.awt.geom.Ellipse2D;
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
            if(Shape.ELLIPSE.equals(element.getShape())) {
                Ellipse2D ellipse = new Ellipse2D.Double(start_with.x, start_with.y, 150, 50);
                g2.draw(ellipse);
                g2.drawString(element.getNode().text, (float) (ellipse.getCenterX() - ellipse.getCenterX() / 8), (float) ellipse.getCenterY());
                prev_elem_end.setLocation(ellipse.getMaxX(), ellipse.getMaxY());
            }
            else if(Shape.SQUARE.equals(element.getShape())){
                Rectangle rectangle = new Rectangle(start_with.x, prev_elem_end.y + 50, 150, 50);
                g2.draw(rectangle);
                g2.drawString(element.getNode().text, (float) (rectangle.getCenterX() - rectangle.getCenterX() / 8), (float) rectangle.getCenterY());
                prev_elem_end.setLocation(rectangle.getMaxX(), rectangle.getMaxY());
            }

        }
    }
}
