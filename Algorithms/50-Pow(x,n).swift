class Solution {
	func myPow(_ x: Double, _ n: Int) -> Double {
		if x == 0 {
			return 0
		}
		let absn = abs(n)
		var result = calculatePow(x, absn)
		if n < 0 {
			result = 1 / result
		}
		return result
	}
	
	func calculatePow(_ x: Double, _ n: Int) -> Double {
		if n == 0 {
			return 1
		}
		if n == 1 {
			return x
		}
		var result = calculatePow(x, n >> 1)
		result *= result
		if n & 1 == 1 {
			result *= x
		}
		return result
	}
}