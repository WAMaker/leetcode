class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var i = 0, j = 0
        var sum = nums[0]
        var minLen = nums.count + 1

        while i < nums.count, j < nums.count {
            if sum < s {
                j += 1
                if j >= nums.count {
                    break
                }
                sum += nums[j]
                continue
            }

            minLen = min(minLen, j - i + 1)
            sum -= nums[i]
            i += 1
        }

        return minLen > nums.count ? 0 : minLen
    }
}
