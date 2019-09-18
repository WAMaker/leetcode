class Solution {
	func divide(_ dividend: Int, _ divisor: Int) -> Int {
		let isPositive = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
		let dividend = abs(dividend)
		let divisor = abs(divisor)
		var left = 0
		var right = dividend
		var result = 0
		
		while left <= right {
			let mid = left + (right - left) >> 1
			if mid * divisor <= dividend {
				result = mid
				left = mid + 1
			} else {
				right = mid - 1
			}
		}
		
		result = isPositive ? result : -result
		if result >= Int32.max {
			return Int(Int32.max)
		}
		return result
	}
}