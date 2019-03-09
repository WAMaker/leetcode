class Solution {
	func integerBreak(_ n: Int) -> Int {
		if n == 2 {
			return 1
		}
		if n == 3 {
			return 2
		}
		var positions = [0, 1, 2, 3]
		
		for i in 4 ... n {
			var maxVal = -1
			for j in 1 ... positions.count / 2 {
				maxVal = max(maxVal, positions[j] * positions[i - j])
			}
			positions.append(maxVal)
		}
		
		return positions[positions.count - 1]
	}
}