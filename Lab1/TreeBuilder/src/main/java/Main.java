import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Main {
    private final static PsiGen generator = new PsiGen();
    private final static List<String> spaces = Arrays.asList(
            "DOC_", "COMMENT", "PACKAGE", "IMPORT",
            "SPACE", "IMPLEMENTS", "EXTENDS", "THROWS",
            "BRACE", "SEMICOLON", "PARENTH", "_KEYWORD", "COMMA"
    );
    private final static List<String> jumped = Arrays.asList(
            "GOTO_KEYWORD", "METHOD_CALL_EXPRESSION",
            "WHILE_STATEMENT", "FOR_STATEMENT", "IF_STATEMENT",
            "FOREACH_STATEMENT", "SWITCH_STATEMENT", "DO_WHILE_STATEMENT",
            "SWITCH_LABEL_STATEMENT", "CASE_KEYWORD",
            "ELSE_KEYWORD", "BINARY_EXPRESSION"
    );

    public static void main(String[] args) {
        if(args.length < 1)
            return;
        System.out.println(args[0]);
        String repoPath = args[0];

        List<String> whiteList = getAllAvailableTokens();
        List<String> blackList = whiteList.stream()
                .filter(p->contains(spaces, p)).collect(Collectors.toList());

        whiteList.removeAll(blackList);

        TreeBuilder treeBuilder = new TreeBuilder(generator, blackList, whiteList);
        System.out.println("Start analyzing repo : " + repoPath);
        ControlFlowGraph cfg = new ControlFlowGraph(treeBuilder.analyzeDir(repoPath), jumped);
        cfg.build();

    }

    private static boolean contains(List<String> blackList, String nodeName){
        for(String blackElem : blackList)
            if(nodeName.contains(blackElem))
                return true;

        return false;
    }

    private static List<String> getAllAvailableTokens() {
        return generator.getAllAvailableTokens();
    }
    public static ASTEntry buildPSI(String filename) {
        return generator.parseFile(filename);
    }
}
