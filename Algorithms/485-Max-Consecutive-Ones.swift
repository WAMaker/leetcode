class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var start = -1
        var maxLength = 0

        for i in 0 ..< nums.count {
            switch (nums[i], start) {
            case (1, -1):
                start = i
            case (1, _), (0, -1):
                break
            case (0, _):
                maxLength = max(maxLength, i - start)
                start = -1
            default:
                break
            }
        }

        if start >= 0 {
            maxLength = max(maxLength, nums.count - start)
        }

        return maxLength
    }
}
