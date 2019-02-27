class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var low = 1
        var high = n

        while low <= high {
            let mid = low + (high - low) >> 1
            let val = (mid * (mid + 1)) >> 1
            if n == val {
                return mid
            }
            if val > n {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return high
    }
}
