class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, target, 0, nums.count - 1)
    }

    private func binarySearch(_ nums: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int {
        if low > high {
            return -1
        }
        if low == high {
            return nums[low] == target ? low : -1
        }
        if nums[low] == target {
            return low
        }
        if nums[high] == target {
            return high
        }

        let mid = low + ((high - low) >> 1)
        if nums[mid] == target {
            return mid
        }

        // 左边顺序，target 在区间内
        if nums[low] < nums[mid], target < nums[mid], nums[low] < target {
            return binarySearch(nums, target, low + 1, mid - 1)
        }

        // 左边顺序, target 不在区间内
        if nums[low] < nums[mid] {
            return binarySearch(nums, target, mid + 1, high - 1)
        }

        // 右边有序，target 在区间内
        if nums[mid] < target, target < nums[high] {
            return binarySearch(nums, target, mid + 1, high - 1)
        }

        // 左边部分有序，target 在区间内
        return binarySearch(nums, target, low + 1, mid - 1)
    }
}
