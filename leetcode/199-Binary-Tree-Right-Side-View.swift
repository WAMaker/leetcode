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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        search(root, 0, &results)
        return results
    }

    private func search(_ root: TreeNode?, _ level: Int, _ results: inout [Int]) {
        guard let root = root else {
            return
        }
        if level >= results.count {
            results.append(root.val)
        }

        search(root.right, level + 1, &results)
        search(root.left, level + 1, &results)
    }
}
