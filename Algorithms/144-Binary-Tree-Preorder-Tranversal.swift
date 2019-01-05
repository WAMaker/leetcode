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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        preorder(root, &result)
        return result
    }

    private func preorder(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else {
            return
        }
        result.append(node.val)
        preorder(node.left, &result)
        preorder(node.right, &result)
    }
}
