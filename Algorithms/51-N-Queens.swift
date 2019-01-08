class Solution {

    private var solution = [Int]()
    private var result = [[String]]()

    func solveNQueens(_ n: Int) -> [[String]] {
        solution = Array(repeating: -1, count: n)

        callNQuees(0, n)

        return result
    }

    private func callNQuees(_ row: Int, _ n: Int) {
        if row == n {
            result.append(transfer(solution))
            return
        }

        for column in 0 ..< n {
            if isOK(row, column, n) {
                solution[row] = column
                callNQuees(row + 1, n)
            }
        }
    }

    private func isOK(_ row: Int, _ column: Int, _ n: Int) -> Bool {
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

    private func transfer(_ solution: [Int]) -> [String] {
        var result = [String]()

        let count = solution.count
        for i in 0 ..< count {
            var arr = Array(repeating: ".", count: count)
            arr[solution[i]] = "Q"
            result.append(arr.joined(separator: ""))
        }

        return result
    }

}
