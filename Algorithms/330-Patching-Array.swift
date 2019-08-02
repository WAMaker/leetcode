class Solution {
	func minPatches(_ nums: [Int], _ n: Int) -> Int {
		var patches = 0
		var sum = 1
		var index = 0
		
		while sum <= n {
			if index >= nums.count || sum < nums[index] {
				patches += 1
				sum = sum << 1
			} else {
				sum += nums[index]
				index += 1
			}
		}
		
		return patches
	}
}