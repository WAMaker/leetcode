class Solution {
	func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
		var arr1 = Array(arr1.reversed())
		var arr2 = Array(arr2.reversed())
		
		var ans = Array(repeating: 0, count: max(arr1.count, arr2.count) + 10)
		for i in 0 ..< max(arr1.count, arr2.count) {
			let val1 = i < arr1.count ? arr1[i] : 0
			let val2 = i < arr2.count ? arr2[i] : 0
			ans[i] = val1 + val2
		}
		
		for i in 0 ..< ans.count {
			while ans[i] >= 2, ans[i + 1] > 0 {
				ans[i] -= 2
				ans[i + 1] -= 1
			}
			while ans[i] >= 2 {
				ans[i] -= 2
				ans[i + 1] += 1
				ans[i + 2] += 1
			}
		}
		
		ans = Array(ans.reversed())
		for num in ans {
			if num == 1 {
				break
			}
			ans.removeFirst()
		}
		
		return ans.isEmpty ? [0] : ans
	}
}