class Solution {
	func countDigitOne(_ n: Int) -> Int {
		var result = 0
		var n1 = 10
		var n2 = 1
		var n = n
		
		while n / n1 > 0 {
			result += (n / n1) * n2 + min(max(n % n1 - n2 + 1, 0), n2)
			n1 *= 10
			n2 *= 10
		}
		result += (n / n1) * n2 + min(max(n % n1 - n2 + 1, 0), n2)
		
		return result
	}
}