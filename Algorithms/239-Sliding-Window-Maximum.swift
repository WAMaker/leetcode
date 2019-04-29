class Solution {
	
	struct MaxItem {
		let index: Int
		let num: Int
	}
	
	func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
		if k == 1 || nums.isEmpty {
			return nums
		}
		
		var maxItems = [MaxItem]()
		var maxNums = [Int]()
		
		nums.enumerated().forEach { i, num in
			defer {
				maxItems.append(MaxItem(index: i, num: nums[i]))
				
				if let item = maxItems.first, i >= k - 1 {
					maxNums.append(item.num)
				}
			}
					  
			if maxItems.isEmpty {
				return
			}
			if i - maxItems[0].index > k - 1 {
				maxItems.removeFirst()
			}
			if maxItems.isEmpty {
				return
			}
			if nums[i] > maxItems[0].num {
				maxItems.removeAll()
				return
			}
			
			for item in maxItems.reversed() {
				if nums[i] >= item.num {
					maxItems.removeLast()
				} else {
					break
				}
			}
		}
		
		return maxNums
	}
}