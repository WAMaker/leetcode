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
	func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
		return traverse(s, t)
	}
	
	func traverse(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
		guard let s = s else {
			return false
		}
		return equal(s, t) || traverse(s.left, t) || traverse(s.right, t)
	}
	
	func equal(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
		if lhs == nil, rhs == nil {
			return true
		}
		guard let lhs = lhs, let rhs = rhs else {
			return false
		}
		return lhs.val == rhs.val && equal(lhs.left, rhs.left) && equal(lhs.right, rhs.right)
	}
}