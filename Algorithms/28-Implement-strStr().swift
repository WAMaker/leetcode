class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count {
            return -1
        }
        if needle.isEmpty {
            return 0
        }
        
        for i in 0 ... haystack.count - needle.count {
            let start = haystack.index(haystack.startIndex, offsetBy: i)
            let end = haystack.index(haystack.startIndex, offsetBy: i + needle.count)
            
            if haystack[start ..< end] == needle {
                return i
            }
        } 
        
        return -1
    }
}
