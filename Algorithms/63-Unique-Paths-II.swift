class Solution {
	func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
		let rows = obstacleGrid.count
		let cols = obstacleGrid[0].count
		
		var pre = Array(repeating: 0, count: cols)
		for (i, val) in obstacleGrid[0].enumerated() {
			if val == 1 {
				break
			}
			pre[i] = 1
		}
		
		for row in 1 ..< rows {
			var next = [Int]()
			for col in 0 ..< cols {
				if obstacleGrid[row][col] == 1 {
					next.append(0)
					continue
				}
				var paths = pre[col]
				if col != 0 {
					paths += next[col - 1]
				}
				next.append(paths)
			}

			pre = next
		}
		
		return pre[cols - 1]
	}
}