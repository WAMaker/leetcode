class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        return search(num, 1, num)
    }

    private func search(_ num: Int, _ low: Int, _ high: Int) -> Bool {
        if low > high {
            return false
        }
        let mid = low + (high - low) >> 1
        let multi = mid * mid
        if multi == num {
            return true
        }
        if multi > num {
            return search(num, low, mid - 1)
        }
        return search(num, mid + 1, high)
    }
}
