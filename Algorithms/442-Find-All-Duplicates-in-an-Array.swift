class Solution {
	func findDuplicates(_ nums: [Int]) -> [Int] {
		var nums = nums
		var result = [Int]()
		
		nums.forEach { num in
			nums[num - 1] = -nums[num - 1]
			if nums[num - 1] > 0 {
				result.append(num)
			}
		}
		
		return result
	}
}