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
	func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
		let (result, _) = find(root, k, 0)
		return result?.val ?? 0
	}
	
	func find(_ root: TreeNode?, _ k: Int, _ idx: Int) -> (TreeNode?, Int) {
		guard let node = root else {
			return (nil, idx)
		}
		let (ln, li) = find(node.left, k, idx)
		if let ln = ln {
			return (ln, k)
		}
		var val = li + 1
		if k == val {
			return (node, k)
		}
		let (rn, ri) = find(node.right, k, val)
		if let rn = rn {
			return (rn, k)
		}
		return (nil, ri)
	}
}