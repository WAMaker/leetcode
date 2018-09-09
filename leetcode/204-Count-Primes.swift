class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }

        var notPrimes = Array(repeating: false, count: n)
        var count = 0

        for i in 2 ..< n where !notPrimes[i] {
            count += 1

            var j = i * 2
            while j < n {
                notPrimes[j] = true
                j += i
            }
        }

        return count
    }
}
