public enum ElementShape {
	ELLIPSE,
	SQUARE,
	DIAMOND
}

public class GraphElement {
	private ASTEntry node;
	private ElementShape elementShape;
}

public class Block {
	private ASTEntry startsWith;
	private ASTEntry endsWith;
	private List<GraphElement> block;
	private boolean isDrawn = false;
}

public class ControlFlowGraph{
	private List<ASTEntry> trees;
	private List<String> jumped;
	private List<List<GraphElement>> treeShapes = new ArrayList<>();
	private List<Block> blocks = new ArrayList<>();
}
