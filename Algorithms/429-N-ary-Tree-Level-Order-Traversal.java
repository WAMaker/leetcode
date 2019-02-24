/*
// Definition for a Node.
class Node {
    public int val;
    public List<Node> children;

    public Node() {}

    public Node(int _val,List<Node> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Solution {
    public List<List<Integer>> levelOrder(Node root) {
        List<List<Integer>> results = new ArrayList<>();
        dfs(root, results, 0);
        return results;
    }
    
    private void dfs(Node node, List<List<Integer>> list, int level) {
        if (node == null) {
            return;
        }
        if (level == list.size()) {
            list.add(new ArrayList<Integer>());
        }
        list.get(level).add(node.val);
        for (Node child: node.children) {
            dfs(child, list, level + 1);
        }
    }
}