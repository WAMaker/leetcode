class Solution {
	func lengthOfLongestSubstring(_ s: String) -> Int {
		var maxLen = 0
		var cdict = [Character: Int]()
		var preVal = 0
		
		s.enumerated().forEach { i, c in
			var len = preVal + 1
			defer {
				cdict[c] = i
				preVal = len
				maxLen = max(len, maxLen)
			}
			if i == 0 {
				return
			}
			guard let preIdx = cdict[c] else {
				return
			}
			let dis = i - preIdx
			if dis <= preVal + 1 {
				len = dis
			}
		}
		
		return maxLen
	}
}