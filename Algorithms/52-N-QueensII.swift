class Solution {
    private var result = 0
    private var solution = [Int]()
    private var n = 0

    func totalNQueens(_ n: Int) -> Int {
        self.n = n
        solution = Array(repeating: -1, count: n)

        searchQueens(0)

        return result
    }

    private func searchQueens(_ row: Int) {
        if row == n {
            result += 1
            return
        }

        for column in 0 ..< n {
            if isOK(row, column) {
                solution[row] = column
                searchQueens(row + 1)
            }
        }
    }

    private func isOK(_ row: Int, _ column: Int) -> Bool {
        var row = row - 1
        var left = column - 1
        var right = column + 1

        while row >= 0 {
            if left >= 0, solution[row] == left {
                return false
            }
            if right < n, solution[row] == right {
                return false
            }
            if solution[row] == column {
                return false
            }

            row -= 1
            left -= 1
            right += 1
        }

        return true
    }
}
