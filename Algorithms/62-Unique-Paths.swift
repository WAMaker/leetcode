class Solution {
	func uniquePaths(_ m: Int, _ n: Int) -> Int {
		var pre = Array(repeating: 1, count: m)
		
		for i in 1 ..< n {
			var next = [Int]()
			next.append(pre[0])
			
			for j in 1 ..< m {
				next.append(pre[j] + next[j - 1])
			}
			
			pre = next
		}
		
		return pre[m - 1]
	}
}