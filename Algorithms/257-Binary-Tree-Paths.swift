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

    private var results = [String]()

    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        pathPrinter(root, "")
        return results
    }

    private func pathPrinter(_ node: TreeNode?, _ str: String) {
        guard let node = node else {
            return
        }
        let path = str + (str.isEmpty ? "" : "->") + "\(node.val)"
        if node.left == nil, node.right == nil {
            results.append(path)
            return
        }
        if let left = node.left {
            pathPrinter(left, path)
        }
        if let right = node.right {
            pathPrinter(right, path)
        }
    }
}
