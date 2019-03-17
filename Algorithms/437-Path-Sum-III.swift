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
	func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
		guard let root = root else {
			return 0
		}
		return dfs(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
	}
	
	func dfs(_ node: TreeNode?, _ sum: Int) -> Int {
		guard let node = node else {
			return 0
		}
		
		var result = 0
		if sum == node.val {
			result += 1
		}
		
		result += dfs(node.left, sum - node.val)
		result += dfs(node.right, sum - node.val)
		
		return result
	}
}