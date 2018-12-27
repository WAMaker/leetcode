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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var array = [root, root]

        while !array.isEmpty {
            let ln = array.removeLast()
            let rn = array.removeLast()

            if ln == nil && rn == nil {
                continue
            }

            if ln?.val != rn?.val {
                return false
            }

            array.append(ln?.left)
            array.append(rn?.right)
            array.append(ln?.right)
            array.append(rn?.left)
        }

        return true
    }
}
