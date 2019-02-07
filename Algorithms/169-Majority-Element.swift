class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var majority = 0

        for i in 0 ..< nums.count {
            if count == 0 {
                majority = nums[i]
            }
            if nums[i] == majority {
                count += 1
            } else {
                count -= 1
            }
        }

        return majority
    }
}
