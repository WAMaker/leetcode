class Solution {
	func findMin(_ nums: [Int]) -> Int {
		var start = 0, end = nums.count - 1

		if nums[start] <= nums[end] {
			return nums[start]
		}
		
		while start + 1 < end {
			let mid = start + (end - start) >> 1
			if nums[mid] >= nums[start] {
				start = mid
			} else {
				end = mid
			}
		}
		
		return nums[end]
	}
}