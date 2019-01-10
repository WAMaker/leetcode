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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return constructNode(nums, 0, nums.count - 1)
    }

    private func constructNode(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        if low > high {
            return nil
        }

        let middle = low + (high - low) >> 1
        let node = TreeNode(nums[middle])
        node.left = constructNode(nums, low, middle - 1)
        node.right = constructNode(nums, middle + 1, high)

        return node
    }
}
