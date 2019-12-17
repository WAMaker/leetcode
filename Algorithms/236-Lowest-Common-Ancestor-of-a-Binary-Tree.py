# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def __init__(self):
        self.res = None
        
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        def dfs(node) -> bool:
            if not node:
                return False
            left = dfs(node.left)
            right = dfs(node.right)
            mid = node.val == p.val or node.val == q.val
            if mid + left + right >= 2:
                self.res = node
            return mid or left or right
        dfs(root)
        return self.res