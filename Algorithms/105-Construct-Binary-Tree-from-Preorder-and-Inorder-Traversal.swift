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
	func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		var map = [Int: Int]()
		inorder.enumerated().forEach {
			map[$1] = $0
		}
		return buildTree(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1, map)
	}
	
	func buildTree(_ preorder: [Int], _ ps: Int, _ pe: Int, _ inorder: [Int], _ ins: Int, _ ine: Int, _ map: [Int: Int]) -> TreeNode? {
		let val = preorder[ps]
		guard ps <= pe, ins <= ine, let index = map[val] else {
			return nil
		}
		let len = index - ins
		
		let root = TreeNode(val)
		root.left = buildTree(preorder, ps + 1, ps + len, inorder, ins, ins + len - 1, map)
		root.right = buildTree(preorder, ps + len + 1, pe, inorder, ins + len + 1, ine, map)
		return root
	}
}