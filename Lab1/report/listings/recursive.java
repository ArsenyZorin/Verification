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
