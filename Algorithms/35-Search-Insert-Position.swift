class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return search(nums, target, 0, nums.count - 1)
    }

    private func search(_ nums: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int {
        if low > high {
            return low
        }
        let mid = low + (high - low) >> 1
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            return search(nums, target, mid + 1, high)
        }
        return search(nums, target, low, mid - 1)
    }
}
