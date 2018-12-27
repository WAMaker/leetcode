class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let s = s.map { $0 }
        let t = t.map { $0 }
        var dict = [Character: Character]()

        for i in 0 ..< s.count {
            let cs = s[i]
            let ct = t[i]
            if let c = dict[cs] {
                if c != ct {
                    return false
                }
            } else if dict.values.contains(ct) {
                return false
            } else {
                dict[cs] = ct
            }
        }

        return true
    }
}
