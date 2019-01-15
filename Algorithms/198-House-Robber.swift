class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        var profits = Array(repeating: 0, count: nums.count)
        profits[0] = nums[0]

        for i in 1 ..< nums.count {
            let preProfits = i >= 2 ? profits[i - 2] : 0
            profits[i] = max(nums[i] + preProfits, profits[i - 1])
        }

        return profits[nums.count - 1]
    }
}
