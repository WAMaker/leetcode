class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let ss = s.sorted()
        let st = t.sorted()
        return ss == st
    }
}
