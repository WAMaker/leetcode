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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        postorder(root, &result)
        return result
    }

    private func postorder(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else {
            return
        }
        postorder(node.left, &result)
        postorder(node.right, &result)
        result.append(node.val)
    }
}
