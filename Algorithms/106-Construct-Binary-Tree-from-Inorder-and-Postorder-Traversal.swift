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
	func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
		var map = [Int: Int]()
		inorder.enumerated().forEach {
			map[$1] = $0
		}
		return buildTree(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1, map)
	}
	
	func buildTree(_ inorder: [Int], _ ins: Int, _ ine: Int, _ postorder: [Int], _ ps: Int, _ pe: Int, _ map: [Int: Int]) -> TreeNode? {
		guard ins <= ine, ps <= pe, let index = map[postorder[pe]] else {
			return nil
		}
		let diff = index - ins
		let root = TreeNode(postorder[pe])
		root.left = buildTree(inorder, ins, ins + diff - 1, postorder, ps, ps + diff - 1, map)
		root.right = buildTree(inorder, index + 1, ine, postorder, ps + diff, pe - 1, map)
		return root
	}
}