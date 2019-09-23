class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        guard let col = dungeon.first?.count else {
            return 1
        }
        let row = dungeon.count
        var hps = [[Int]]()
        for _ in 0 ..< dungeon.count {
            hps.append([Int](repeating: Int.max, count: col))
        }
        
        for i in stride(from: row - 1, through: 0, by: -1) {
            for j in stride(from: col - 1, through: 0, by: -1) {
                var hp = hps[i][j]
                
                if i < row - 1 {
                    hp = min(hp, hps[i + 1][j] - dungeon[i][j])
                }
                if j < col - 1 {
                    hp = min(hp, hps[i][j + 1] - dungeon[i][j])
                }
                if i == row - 1, j == col - 1 {
                    hp = 1 - dungeon[i][j]
                }
                
                hps[i][j] = max(1, hp)
            }
        }
        
        return hps[0][0]
    }
}