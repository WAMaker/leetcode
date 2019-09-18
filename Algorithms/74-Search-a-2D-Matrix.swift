class Solution {
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		if matrix.isEmpty || matrix[0].isEmpty {
			return false
		}
		
		let row = matrix.count, col = matrix[0].count
		var left = 0, right = row * col
		while left < right {
			let mid = left + (right - left) >> 1
			let val = matrix[mid / col][mid % col] 
			if val == target {
				return true
			}
			if val < target {
				left = mid + 1
			} else {
				right = mid
			}
		}
		
		return false
	}
}