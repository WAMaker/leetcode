class Solution {
    func numSquares(_ n: Int) -> Int {
        var counts = Array(repeating: Int.max - 10000, count: n + 1)
        counts[0] = 0

        for i in 0 ..< n {
            var j = 1
            while i + j * j <= n {
                let val = i + j * j
                counts[val] = min(counts[val], counts[i] + 1)
                j += 1
            }
        }

        return counts[n]
    }
}
