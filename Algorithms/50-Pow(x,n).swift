class Solution {
	func myPow(_ x: Double, _ n: Int) -> Double {
		var x = n >= 0 ? x : 1 / x
		var n = abs(n)
		var ans = 1.0
		
		while n > 0 {
			if n & 1 == 1 {
				ans *= x
			}
			x *= x
			n >>= 1
		}
		
		return ans
	}
}