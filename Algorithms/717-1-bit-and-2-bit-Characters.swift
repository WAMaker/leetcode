class Solution {
	func isOneBitCharacter(_ bits: [Int]) -> Bool {
		var index = 0
		while index < bits.count - 1 {
			index += bits[index] == 0 ? 1 : 2
		}
		return index == bits.count - 1
	}
}