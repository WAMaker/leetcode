/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root).1
    }

    private func dfs(_ node: TreeNode?) -> (Int, Bool) {
        guard let node = node else {
            return (0, true)
        }

        let (height1, isBalanced1) = dfs(node.left)
        let (height2, isBalanced2) = dfs(node.right)

        let height = max(height1, height2) + 1
        if isBalanced1 && isBalanced2 {
            return (height, abs(height1 - height2) < 2)
        }
        return (height, false)
    }
}
