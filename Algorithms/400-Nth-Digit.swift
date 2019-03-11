class Solution {
	func findNthDigit(_ n: Int) -> Int {
		var num = 1, singleDigitCount = 1
		
		func next(_ i: Int) -> Int {
			return i + (num * 10 - num) * singleDigitCount
		}

		var i = 1
		while next(i) < n {
			i = next(i)
			num *= 10
			singleDigitCount += 1
		}
		
		var targetNum = num + (n - i) / singleDigitCount
		let targetDigitIndex = (n - i) % singleDigitCount
		var targetDigits = [Int]()
		while targetNum > 0 {
			targetDigits.insert(targetNum % 10, at: 0)
			targetNum /= 10
		}
		return targetDigits[targetDigitIndex]
	}
}