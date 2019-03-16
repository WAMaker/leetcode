class Solution {
	func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
		var nums = nums
		nums.enumerated().forEach { idx, num in
			var val = num
			while val != nums[val - 1] {
				let tmp = nums[val - 1]
				nums[val - 1] = val
				val = tmp
			}
		}
		
		var result = [Int]()
		nums.enumerated().forEach { idx, num in
			if idx != num - 1 {
				result.append(idx + 1)
			}
		}
		return result
	}
}