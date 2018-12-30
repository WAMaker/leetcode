class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var num = n

        while num != 1 {
            var tmp = num
            var result = 0

            while tmp != 0 {
                let tmp1 = tmp % 10
                result += tmp1 * tmp1
                tmp /= 10
            }

            if set.contains(result) {
                return false
            }
            set.insert(result)
            num = result
        }

        return true
    }
}
