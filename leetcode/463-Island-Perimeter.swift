class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        let rowCount = grid.count
        for (i, row) in grid.enumerated() {
            let columnCount = row.count
            for (j, item) in row.enumerated() where item == 1 {
                // top
                if !(i > 0 && grid[i - 1][j] == 1) {
                    result += 1
                }
                // bottom
                if !(i < rowCount - 1 && grid[i + 1][j] == 1) {
                    result += 1
                }
                // left
                if !(j > 0 && grid[i][j - 1] == 1) {
                    result += 1
                }
                // right
                if !(j < columnCount - 1 && grid[i][j + 1] == 1) {
                    result += 1
                }
            }
        }
        return result
    }
}
