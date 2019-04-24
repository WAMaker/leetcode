class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard let cols = matrix.first?.count else {
            return matrix
        }

        let rows = matrix.count
        var dist = [[Int]]()

        for i in 0 ..< rows {
            dist.append(Array(repeating: Int.max - 10000, count: cols))
            for j in 0 ..< cols {
                if matrix[i][j] == 0 {
                    dist[i][j] = 0
                    continue
                }
                if i > 0 {
                    dist[i][j] = min(dist[i][j], dist[i - 1][j] + 1)
                }
                if j > 0 {
                    dist[i][j] = min(dist[i][j], dist[i][j - 1] + 1)
                }
            }
        }

        for i in stride(from: rows - 1, through: 0, by: -1) {
            for j in stride(from: cols - 1, through: 0, by: -1) {
                if i < rows - 1 {
                    dist[i][j] = min(dist[i][j], dist[i + 1][j] + 1)
                }
                if j < cols - 1 {
                    dist[i][j] = min(dist[i][j], dist[i][j + 1] + 1)
                }
            }
        }

        return dist
    }
}
