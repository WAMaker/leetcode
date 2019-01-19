class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        guard let cols = matrix.first?.count else {
            return []
        }
        
        let rows = matrix.count
        let ops = [(-1, +1), (+1, -1)]
        var opIdx = 0
        var i = 1, j = -1
        var results = [Int]()
        
        while true {
            if i == rows - 1, j == cols - 1 {
                break
            }
            var ti = i + ops[opIdx].0
            var tj = j + ops[opIdx].1
            var dc = true
            
            if ti < 0, tj < cols {
                ti = 0
            } else if tj >= cols {
                ti = i + 1
                tj = cols - 1
            } else if ti < rows, tj < 0 {
                tj = 0
            } else if ti >= rows {
                ti = rows - 1
                tj = j + 1
            } else {
                dc = false
            }
            
            if dc {
                opIdx = (opIdx + 1) % ops.count
            }
            
            i = ti
            j = tj
            results.append(matrix[i][j])
        }
        
        return results
    }
}
