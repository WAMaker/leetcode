class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var result = 0
        S.forEach { s in
            if J.contains(s) {
                result += 1
            }
        }
        return result
    }
}
