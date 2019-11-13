# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lcaDeepestLeaves(self, root: TreeNode) -> TreeNode:
        return self.dfs(root, 0)[1]
        
    def dfs(self, root: TreeNode, depth: int) -> (int, TreeNode):
        if root is None:
            return (-1, None)
        if root.left is None and root.right is None:
            return (depth, root)
        
        lr = self.dfs(root.left, depth + 1)
        rr = self.dfs(root.right, depth + 1)
        
        if lr[0] > rr[0]:
            return (lr[0], lr[1])
        elif lr[0] < rr[0]:
            return (rr[0], rr[1])
        return (rr[0], root)