class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var vals = [Int: [String]]()
        strs.forEach { str in
            vals[str.sorted().hashValue, default: []].append(str)
        }
        return Array(vals.values)
    }
}
