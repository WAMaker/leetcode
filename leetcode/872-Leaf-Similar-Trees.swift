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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var leafs1 = [Int]()
        dfs(root1, &leafs1)

        var leafs2 = [Int]()
        dfs(root2, &leafs2)

        if leafs1.count != leafs2.count {
            return false
        }

        for i in 0 ..< leafs1.count {
            if leafs1[i] != leafs2[i] {
                return false
            }
        }
        return true
    }

    private func dfs(_ node: TreeNode?, _ leafs: inout [Int]) {
        guard let node = node else {
            return
        }
        if node.left == nil && node.right == nil {
            leafs.append(node.val)
            return
        }
        dfs(node.left, &leafs)
        dfs(node.right, &leafs)
    }
}
