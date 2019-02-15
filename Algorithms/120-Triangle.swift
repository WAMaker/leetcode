class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0][0]
        }
        var dp = Array(repeating: 0, count: triangle.count + 1)
        for row in triangle.reversed() {
            for i in 0 ..< row.count {
                dp[i] = row[i] + min(dp[i], dp[i + 1])
            }
        }
        return dp[0]
    }
}
