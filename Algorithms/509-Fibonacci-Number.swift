class Solution {
	func fib(_ N: Int) -> Int {
		if N < 2 {
			return N
		}
		
		var i = 1
		var pre1 = 0
		var pre2 = 1
		
		while i < N {
			(pre1, pre2) = (pre1 + pre2, pre1)
			i += 1
		}
		
		return pre1 + pre2
	}
}