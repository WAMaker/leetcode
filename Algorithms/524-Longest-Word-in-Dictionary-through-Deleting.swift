class Solution {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        var maxStr = ""
        d.forEach { toMatchStr in
            guard s.isMatching(str: toMatchStr) else {
                return
            }
            if toMatchStr.count > maxStr.count || (toMatchStr.count == maxStr.count && toMatchStr < maxStr) {
                maxStr = toMatchStr
            }
        }
        return maxStr
    }
}

extension String {

    func isMatching(str: String) -> Bool {
        var cursor = 0
        let count = self.count
        let strCount = str.count
        for (idx, c) in self.enumerated() {
            if count - 1 - idx < strCount - 1 - cursor {
                return false
            }
            if cursor >= str.count {
                return true
            }
            if c == str[str.index(str.startIndex, offsetBy: cursor)] {
                cursor += 1
            }
        }
        return cursor >= str.count
    }

}
