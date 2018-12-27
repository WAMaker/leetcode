class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var dict = [Character: Int]()
        var result = 0

        s.forEach { c in
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
            }
        }

        var hasOdd = false
        dict.forEach { _, val in
            if val % 2 == 0 {
                result += val
            } else {
                hasOdd = true
                result += val - 1
            }
        }

        return result + (hasOdd ? 1 : 0)
    }
}
