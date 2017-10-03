import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.view.mxGraph;

import javax.swing.JFrame;


public class HelloWorld extends JFrame{
    public HelloWorld()
	{
		super("Hello, World!");

		mxGraph graph = new mxGraph();
		Object parent = graph.getDefaultParent();

		graph.getModel().beginUpdate();
		try
		{
			Object v1 = graph.insertVertex(parent, null, "Hello", 20, 20, 80,
					30);
			Object v2 = graph.insertVertex(parent, null, "World!", 20, 150, 80, 30);
			Object v3 = graph.insertVertex(parent, null, "World2!", 20, 250, 80, 30);
			graph.insertEdge(parent, null, "Edge", v1, v3);
		}
		finally
		{
			graph.getModel().endUpdate();
		}

		mxGraphComponent graphComponent = new mxGraphComponent(graph);
		getContentPane().add(graphComponent);
	}

	public void view(){
        HelloWorld frame = new HelloWorld();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(400, 320);
		frame.setVisible(true);
    }

}
