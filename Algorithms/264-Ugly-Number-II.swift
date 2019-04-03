class Solution {
	func nthUglyNumber(_ n: Int) -> Int {
		var index2 = 0, index3 = 0, index5 = 0
		var factor2 = 2, factor3 = 3, factor5 = 5
		var uglyNums = [1]
		
		for i in 1 ..< n {
			let minVal = min(min(factor2, factor3), factor5)
			uglyNums.append(minVal)
			if minVal == factor2 {
				index2 += 1
				factor2 = 2 * uglyNums[index2]
			}
			if minVal == factor3 {
				index3 += 1
				factor3 = 3 * uglyNums[index3]
			}
			if minVal == factor5 {
				index5 += 1
				factor5 = 5 * uglyNums[index5]
			}
		}
		return uglyNums[n - 1]
	}
}