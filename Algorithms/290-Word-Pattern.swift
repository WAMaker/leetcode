class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let array = str.split(separator: " ").map { String($0) }
        guard pattern.count == array.count else {
            return false
        }

        var dict = [String: Character]()
        var patternSet = Set<Character>()
        for (idx, val) in pattern.enumerated() {
            let word = array[idx]

            if let pattern = dict[word] {
                if pattern == val {
                    continue
                }
                return false
            }

            if patternSet.contains(val) {
                return false
            }
            dict[word] = val
            patternSet.insert(val)
        }

        return true
    }
}
