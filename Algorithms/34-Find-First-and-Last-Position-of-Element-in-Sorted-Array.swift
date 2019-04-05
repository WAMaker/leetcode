class Solution {
	func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
		return search(nums, 0, nums.count - 1, target)
	}
	
	func search(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> [Int] {
		var range = [-1, -1]
		if start > end {
			return range
		}
		let middle = start + (end - start) >> 1
		if nums[middle] > target {
			return search(nums, start, middle - 1, target)
		}
		if nums[middle] < target {
			return search(nums, middle + 1, end, target)
		}
		
		let ls = search(nums, start, middle - 1, target)
		let rs = search(nums, middle + 1, end, target)

		range[0] = ls[0] == -1 ? middle : ls[0]
		range[1] = rs[1] == -1 ? middle : rs[1]
		return range
	}
}