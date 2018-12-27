class Solution {
    func mySqrt(_ x: Int) -> Int {
        var low = 1
        var high = x

        while low <= high {
            let mid = low + (high - low) >> 1
            let val = mid * mid
            if val > x {
                high = mid - 1
            } else if val < x {
                low = mid + 1
            } else {
                return mid
            }
        }

        return high
    }
}
