class Solution {
    func sortColors(_ nums: inout [Int]) {
        sort(&nums, 0, nums.count - 1)
    }
    
    func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        if lo >= hi {
            return
        }
        var lt = lo, gt = hi, v = nums[lo]
        var i = lo
        
        while (i <= gt) {
            if nums[i] > v {
                (nums[i], nums[gt]) = (nums[gt], nums[i])
                gt -= 1
            } else if nums[i] < v {
                (nums[i], nums[lt]) = (nums[lt], nums[i])
                lt += 1
                i += 1
            } else {
                i += 1
            }
        }
        
        sort(&nums, lo, lt - 1)
        sort(&nums, gt + 1, hi)
    }
}