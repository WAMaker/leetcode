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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var results = [[Int]]()
        var current = [root]
        var next = [TreeNode]()
        var isLeft = true

        while !current.isEmpty {
            var result = [Int]()

            for i in 0 ..< current.count {
                result.append(current[i].val)
                if let left = current[i].left {
                    next.append(left)
                }
                if let right = current[i].right {
                    next.append(right)
                }
            }

            if isLeft {
                results.append(result)
            } else {
                results.append(result.reversed())
            }
            isLeft = !isLeft
            current = next
            next = []
        }

        return results
    }
}
