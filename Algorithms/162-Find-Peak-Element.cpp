class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let m = l + (r - l) >> 1
            if nums[m] > nums[m + 1] {
                r = m
            } else {
                l = m + 1
            }
        }
        return r
    }
}