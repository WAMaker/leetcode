class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dic = [Character: Int]()
        s.forEach {
            if let count = dic[$0] {
                dic[$0] = count + 1
            } else {
                dic[$0] = 1
            }
        }
        for (i, c) in s.enumerated() where dic[c]! == 1 {
            return i
        }
        return -1
    }
}
