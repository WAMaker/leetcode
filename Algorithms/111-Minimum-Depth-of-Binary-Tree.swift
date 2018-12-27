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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil && root.right == nil {
            return 1
        }
        var minLevel = Int.max
        dfs(root, 1, &minLevel)
        return minLevel
    }

    private func dfs(_ root: TreeNode?, _ level: Int, _ minLevel: inout Int) {
        guard let root = root else {
            return
        }
        if root.left == nil && root.right == nil {
            minLevel = min(level, minLevel)
            return
        }

        if let left = root.left {
            dfs(left, level + 1, &minLevel)
        }
        if let right = root.right {
            dfs(right, level + 1, &minLevel)
        }
    }
}
