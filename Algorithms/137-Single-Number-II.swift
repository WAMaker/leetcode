class Solution {
	func singleNumber(_ nums: [Int]) -> Int {
		var a = 0, b = 0
		
		nums.forEach { num in
			b = (b ^ num) & ~a
			a = (a ^ num) & ~b
		}
		
		return a | b
	}
}