class Solution {

    private var sum = [[Int]]()
    private var rowCount = 0
    private var columnCount = 0

    func minPathSum(_ grid: [[Int]]) -> Int {
        guard let columnCount = grid.first?.count else {
            return Int.max
        }
        self.rowCount = grid.count
        self.columnCount = columnCount

        for i in 0 ..< rowCount {
            sum.append(Array(repeating: Int.max, count: columnCount))
            for j in 0 ..< columnCount {
                if i == 0, j == 0 {
                    sum[i][j] = grid[i][j]
                } else {
                    let top = i > 0 ? sum[i - 1][j] : Int.max
                    let left = j > 0 ? sum[i][j - 1] : Int.max
                    sum[i][j] = min(top, left) + grid[i][j]
                }
            }
        }

        return sum[rowCount - 1][columnCount - 1]
    }
}
