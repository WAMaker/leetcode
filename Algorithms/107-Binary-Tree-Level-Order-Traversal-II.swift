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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var results = [[Int]]()
        dfs(root, level: 0, results: &results)
        return results.reversed()
    }

    private func dfs(_ root: TreeNode?, level: Int, results: inout [[Int]]) {
        guard let root = root else {
            return
        }

        if level < results.count {
            var result = results[level]
            result.append(root.val)
            results[level] = result
        } else {
            results.append([root.val])
        }

        dfs(root.left, level: level + 1, results: &results)
        dfs(root.right, level: level + 1, results: &results)
    }
}
