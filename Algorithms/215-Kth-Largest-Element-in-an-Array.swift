class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        return quickFind(&nums, 0, nums.count - 1, k)
    }
    
    private func quickFind(_ nums: inout [Int], _ lo: Int, _ hi: Int, _ k: Int) -> Int {
        if lo == hi {
            return nums[lo]
        }
        let mid = lo + (hi - lo) >> 1
        let pivot = midNum(nums[lo], nums[hi], nums[mid])
        
        var i = lo - 1, j = hi + 1
        while (i < j) {
            repeat {
                j -= 1
            } while nums[j] < pivot && i <= j
            repeat {
                i += 1
            } while nums[i] > pivot && i <= j
            
            if i < j {
                (nums[i], nums[j]) = (nums[j], nums[i])
            }
        }

        if k - 1 <= j {
            return quickFind(&nums, lo, j, k)
        }
        return quickFind(&nums, j + 1, hi, k)
    }
    
    private func midNum(_ a: Int, _ b: Int, _ c: Int) -> Int {
        if a > b {
            return b > c ? b : min(a, c)
        }
        if b > c {
            return a > c ? max(a, c) : c
        }
        return b
    }
}