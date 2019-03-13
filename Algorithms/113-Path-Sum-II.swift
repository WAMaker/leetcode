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
	func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
		var result = [[Int]]() 
		var path = [Int]()
		pathCheck(root, sum, &path, &result)
		return result
	}
	
	func pathCheck(_ root: TreeNode?, _ sum: Int, _ path: inout [Int], _ result: inout [[Int]]) {
		guard let node = root else {
			return
		}
		path.append(node.val)

		let diff = sum - node.val
		if diff == 0, node.left == nil, node.right == nil {
			result.append(path)
		}
		pathCheck(node.left, diff, &path, &result)
		pathCheck(node.right, diff, &path, &result)
		
		path.removeLast()
	}
}