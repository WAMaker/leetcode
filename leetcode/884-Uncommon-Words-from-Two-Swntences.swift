class Solution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        var common = Set<String>()
        var unique = Set<String>()

        let operation: (String) -> Void = {
            if unique.contains($0) {
                unique.remove($0)
                common.insert($0)
                return
            }
            if !common.contains($0) {
                unique.insert($0)
            }
        }

        let blank = Character(" ")
        A.split(separator: blank)
            .map { String($0) }
            .forEach(operation)
        B.split(separator: blank)
            .map { String($0) }
            .forEach(operation)

        return Array(unique)
    }
}
