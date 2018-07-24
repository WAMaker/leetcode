class Solution {
    func sortColors(_ nums: inout [Int]) {
        let count = nums.count

        var h = 1
        while h < count / 3 {
            h = 3 * h + 1
        }

        while h >= 1 {
            for i in h..<count {
                var j = i
                while j >= h {
                    if nums[j] < nums[j - h] {
                        (nums[j - h], nums[j]) = (nums[j], nums[j - h])
                    }
                    j -= h
                }
            }
            h /= 3
        }
    }
}
