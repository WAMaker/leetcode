"""
# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""
# 常规解法
class Solution:
    def connect(self, root: 'Node') -> 'Node':
        if not root:
            return root
        pre, cur = root, root.left
        while pre and cur:
            node, tmp = pre, cur
            while node:
                tmp.next = node.right
                tmp = node.right
                node = node.next
                if node:
                    tmp.next = node.left
                    tmp = tmp.next
            pre = cur
            cur = pre.left
        return root

# 有意思的解法
class Solution:
    def connect(self, root: 'Node') -> 'Node':
        if not root:
            return root
        left, right = root.left, root.right
        while left:
            left.next = right
            left = left.right
            right = right.left
        self.connect(root.left)
        self.connect(root.right)
        return root