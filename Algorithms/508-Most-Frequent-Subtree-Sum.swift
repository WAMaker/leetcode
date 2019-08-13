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
	private var sumDic: [Int: Int] = [: ]
	private var maxCount = 0
	
	func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
		_ = findSum(root)
		var ans: [Int] = []
		for (key, val) in sumDic where val == maxCount {
			ans.append(key)
		}
		return ans
	}
	
	func findSum(_ root: TreeNode?) -> Int {
		guard let root = root else {
			return 0
		}
		let leftSum = findSum(root.left)
		let rightSum = findSum(root.right)
		let sum = leftSum + rightSum + root.val
		let count = sumDic[sum, default: 0] + 1
		sumDic[sum] = count
		maxCount = max(maxCount, count)
		return sum
	}
}