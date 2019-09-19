class Solution {
	func search(_ nums: [Int], _ target: Int) -> Bool {
		if nums.isEmpty {
			return false
		}
		
		var left = 0, right = nums.count - 1
		while nums[left] == nums[right], left < right {
			right -= 1
		}
		
		while left <= right {
			let mid = left + (right - left) >> 1
			if nums[left] == target || 
				nums[right] == target || 
				nums[mid] == target {
				return true
			}
			
			if nums[mid] < target { /// 中间值小于目标
				if nums[mid] <= nums[right], nums[right] < target { /// 右边单调递增，最右小于目标
					right = mid - 1
				} else {
					left = mid + 1
				}
			} else { /// 中间值大于目标
				if nums[left] <= nums[mid], nums[left] > target { /// 左边单调递增，最左大于目标
					left = mid + 1
				} else {
					right = mid - 1
				}
			}
		}
		
		return false
	}
}