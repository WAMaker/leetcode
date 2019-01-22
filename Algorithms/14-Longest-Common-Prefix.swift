class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else {
            return ""
        }
        var pre = first[first.startIndex...]
        
        for i in 1 ..< strs.count {
            let str = strs[i]
            let minLength = min(pre.count, str.count)
            var matches = -1

            for j in stride(from: minLength - 1, through: 0, by: -1) {
                let pi = first.index(first.startIndex, offsetBy: j)
                let si = str.index(str.startIndex, offsetBy: j)
                
                if first[...pi] == str[...si] {
                    matches = j
                    break
                }
            }
            if matches == -1 {
                return ""
            }
            let idx = first.index(first.startIndex, offsetBy: matches)
            pre = first[...idx]
        }
        
        return String(pre)
    }
}
