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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        if root!.left == nil && root!.right == nil {
            return root!.val
        }
        var leftMostLevel = 0
        var result = root!.val
        dfs(root, 0, &result, &leftMostLevel)
        return result
    }

    private func dfs(_ root: TreeNode?, _ level: Int, _ val: inout Int, _ leftMostLevel: inout Int) {
        guard let root = root else {
            return
        }

        if level > leftMostLevel {
            val = root.val
            leftMostLevel = level
        }

        if root.left == nil && root.right == nil {
            return
        }

        if let left = root.left {
            dfs(left, level + 1, &val, &leftMostLevel)
        }
        if let right = root.right {
            dfs(right, level + 1, &val, &leftMostLevel)
        }
    }
}
