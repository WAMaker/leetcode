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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var results = [Int]()
        var currentNodes = [root]
        var nextNodes = [TreeNode]()

        while !currentNodes.isEmpty || !nextNodes.isEmpty {
            var largest = Int.min
            currentNodes.forEach { node in
                largest = max(largest, node.val)
                if let left = node.left {
                    nextNodes.append(left)
                }
                if let right = node.right {
                    nextNodes.append(right)
                }
            }

            results.append(largest)
            currentNodes = nextNodes
            nextNodes = []
        }

        return results
    }
}
