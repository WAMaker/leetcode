class Solution {
    func findWords(_ words: [String]) -> [String] {
        let topSet = Set(["q","w","e","r","t","y","u","i","o","p"])
        let middleSet = Set(["a","s","d","f","g","h","j","k","l"])
        let bottomSet = Set(["z","x","c","v","b","n","m"])

        var results = [String]()
        words.forEach { word in
            let charSet = Set(word.lowercased().map { "\($0)" })
            if charSet.isSubset(of: topSet) ||
                charSet.isSubset(of: middleSet) ||
                charSet.isSubset(of: bottomSet) {
                results.append(word)
            }
        }
        return results
    }
}
