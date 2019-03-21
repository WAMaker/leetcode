class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        return dfs(nums, S, 0, 0)
    }

    private func dfs(_ nums: [Int], _ S: Int, _ sum: Int, _ i: Int) -> Int {
        if i == nums.count - 1 {
            var result = 0
            if sum + nums[i] == S {
                result += 1
            }
            if sum - nums[i] == S {
                result += 1
            }
            return result
        }
        return dfs(nums, S, sum + nums[i], i + 1) + dfs(nums, S, sum - nums[i], i + 1)
    }
}
