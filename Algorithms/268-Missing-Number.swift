class Solution {
	func missingNumber(_ nums: [Int]) -> Int {
		var total = nums.count * (nums.count + 1) / 2
		nums.forEach {
			total -= $0
		}
		return total
	}
}