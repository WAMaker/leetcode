
class NumArray {
	private var sum: [Int]

	init(_ nums: [Int]) {
		sum = [Int](repeating: 0, count: nums.count)
		
		var tmp = 0
		nums.enumerated().forEach { i, num in
			tmp += num
			sum[i] = tmp
		}
		print(sum)
	}
	
	func sumRange(_ i: Int, _ j: Int) -> Int {
		if i == 0 {
			return sum[j]
		}
		return sum[j] - sum[i - 1]
	}
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */