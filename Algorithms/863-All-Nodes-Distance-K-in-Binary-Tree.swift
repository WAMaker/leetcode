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
    private var target: TreeNode?
    private var K = 0
    private var results = [Int]()

    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
        self.target = target
        self.K = K
        self.results = []

        dfs(root)

        return results
    }

    @discardableResult
    private func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return -1
        }
        if node.val == target!.val {
            subtree(add: node, distance: 0)
            return 1
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        if left != -1 {
            if left == K {
                results.append(node.val)
            } else {
                subtree(add: node.right, distance: left + 1)
            }
            return left + 1
        }
        if right != -1 {
            if right == K {
                results.append(node.val)
            } else {
                subtree(add: node.left, distance: right + 1)
            }
            return right + 1
        }
        return -1
    }

    private func subtree(add node: TreeNode?, distance: Int) {
        guard let node = node else {
            return
        }
        if distance == K {
            results.append(node.val)
        } else {
            subtree(add: node.left, distance: distance + 1)
            subtree(add: node.right, distance: distance + 1)
        }
    }
}
