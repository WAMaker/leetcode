class Solution {
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		guard let cols = matrix.first?.count else {
			return false
		}
		return binarySearchIn2D(matrix, 0, matrix.count - 1, 0, cols - 1, target)
	}
	
	private func binarySearchIn2D(_ matrix: [[Int]], _ startX: Int, _ endX: Int, _ startY: Int, _ endY: Int, _ target: Int) -> Bool {
		if startX > endX || startY > endY {
			return false
		}

		let midX = (startX + endX) / 2
		let col = binarySearch(matrix[midX], startY, endY, target)
		if matrix[midX][col] == target {
			return true
		}
		
		return binarySearchIn2D(matrix, startX, midX - 1, col, endY, target) || binarySearchIn2D(matrix, midX + 1, endX, startY, col, target)
	}
	
	private func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
		let mid = (start + end) / 2
		if start >= end || array[mid] == target {
			return mid
		}
		if array[mid] > target {
			return binarySearch(array, start, mid - 1, target)
		}
		if mid == array.count - 1 || array[mid + 1] > target {
			return mid
		}
		return binarySearch(array, mid + 1, end, target)
	}
}