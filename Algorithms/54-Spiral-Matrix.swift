class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard let cols = matrix.first?.count else {
            return []
        }
        let rows = matrix.count
        let dir = [(0, +1), (+1, 0), (0, -1), (-1, 0)]
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var result = [Int]()
        var count = 0
        var i = 0, j = -1
        var dirIdx = 0
        
        while count < rows * cols {
            let tmpI = i + dir[dirIdx].0
            let tmpJ = j + dir[dirIdx].1
            if tmpI < 0 || tmpI >= rows || tmpJ < 0 || tmpJ >= cols || visited[tmpI][tmpJ] {
                dirIdx = (dirIdx + 1) % dir.count
                continue
            }
            
            i = tmpI
            j = tmpJ
            result.append(matrix[i][j])
            visited[i][j] = true
            count += 1
        }
        
        return result
    }
}
