class Solution {
	func maxSubArray(_ nums: [Int]) -> Int {
		if nums.isEmpty {
			return Int.min
		}
		var dp = nums
		
		var maxSum = nums[0]
		for i in 1 ..< nums.count {
			dp[i] = max(dp[i - 1] + nums[i], dp[i])
			maxSum = max(maxSum, dp[i])
		}
		
		return maxSum
	}
}