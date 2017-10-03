import com.google.gson.Gson;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

public class TreeBuilder {
    private static final String JAVA_EXTENSION = ".java";
    private static final String METHOD_TOKEN = "METHOD";
    private static final String CODEBLOCK_TOKEN= "CODE_BLOCK";
    private static List<String> blackList;
    private static List<String> whiteList;
    private final PsiGen psiGenerator;
    private String workingDir = System.getProperty("user.dir");

    public TreeBuilder(final PsiGen psiGenerator) {
        this.psiGenerator = psiGenerator;
    }

    public TreeBuilder(final PsiGen psiGenerator, final List<String> blackList, final List<String> whiteList) {
        this.psiGenerator = psiGenerator;
        this.blackList = blackList;
        this.whiteList = whiteList;
    }

    private static boolean checkFileExtension(Path filePath) {
        String fileName = filePath.getFileName().toString();
        return fileName.endsWith(JAVA_EXTENSION);
    }

    private List<ASTEntry> analyzeDirectory(String repoPath) throws IOException{

        List<ASTEntry> repoTree = new ArrayList<>();
        final List<String> javaFiles = Files.walk(Paths.get(repoPath),
                FileVisitOption.FOLLOW_LINKS).
                filter(f -> Files.isRegularFile(f))
                .filter(TreeBuilder::checkFileExtension)
                .map(Path::toString)
                .map(s -> s.replace(repoPath, ""))
                .collect(Collectors.toList());

        int i = 0;
        for(String file : javaFiles){
            System.out.println("File name: " + file);
            repoTree.add(Main.buildPSI(repoPath + file).removeSpaces(blackList));
            System.out.println("Completed " + (++i) + " / " + javaFiles.size());
        }
        return getMethodBlocks(repoTree);
    }

    private List<ASTEntry> getMethodBlocks(List<ASTEntry> trees){
        List<ASTEntry> methodsList = new ArrayList<>();
        for(ASTEntry tree : trees){
            if(!tree.nodeName.contains(METHOD_TOKEN))
                methodsList.addAll(getMethodBlocks(tree.children));
            else {
                for(ASTEntry node : tree.children)
                    if(node.nodeName.contains(CODEBLOCK_TOKEN)) {
                        methodsList.add(node);
                        break;
                    }
            }
        }
        return methodsList;
    }

    List<ASTEntry> analyzeDir(String repoPath) {
        List<ASTEntry> methods = null;
        try {
            methods = analyzeDirectory(repoPath);
            //gsonSerialization(methods, workingDir + "/javaFileTree");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return methods;
    }

    private void gsonSerialization(Object obj, String path){
        Gson gson = new Gson();

        FileWriter fw = null;
        BufferedWriter bw = null;
        try {
            fw = new FileWriter(path);
            bw = new BufferedWriter(fw);
            bw.write(gson.toJson(obj));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if (bw != null)
                    bw.close();
                if (fw != null)
                    fw.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}