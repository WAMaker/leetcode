class Solution {
	func getPermutation(_ n: Int, _ k: Int) -> String {
		var numUsed = [Bool](repeating: false, count: n + 1)
		numUsed[0] = true

		var factorial = 1
		for i in 1 ..< n {
			factorial *= i
		}

		var result = ""
		var k = k
		var divisor = n - 1

		for i in 0 ..< n {
			for (num, used) in numUsed.enumerated() {
				if used {
					continue
				}
				if k > factorial {
					k -= factorial
				} else {
					result += "\(num)"
					numUsed[num] = true
					break
				}
			}
			if divisor > 1 {
				factorial /= divisor
				divisor -= 1
			}
		}

		return result
	}
}