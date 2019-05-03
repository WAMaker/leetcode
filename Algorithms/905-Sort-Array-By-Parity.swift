class Solution {
	func sortArrayByParity(_ A: [Int]) -> [Int] {
		return A.sorted {
			if $0 % 2 == 1, $1 % 2 == 0 {
				return false
			}
			if $0 % 2 == 0, $1 % 2 == 1 {
				return true
			}
			return true
		}
	}
}