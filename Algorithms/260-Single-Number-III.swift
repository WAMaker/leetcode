class Solution {
	func singleNumber(_ nums: [Int]) -> [Int] {
		guard var xor = nums.first else {
			return []
		}
		nums[1...].forEach { num in
			xor ^= num
		}
		let index = xor.firstBitOneIndex
		
		var result1 = 0, result2 = 0
		nums.forEach { num in
			if (num >> index) & 1 == 0 {
				result1 ^= num
			} else {
				result2 ^= num
			}
		}
		
		return [result1, result2]
	}
	
}

extension Int {
	
	var firstBitOneIndex: Int {
		if self == 0 {
			return -1
		}
		var index = 0
		var num = self
		while num & 1 == 0 {
			num = num >> 1
			index += 1
		}
		return index
	}
	
}