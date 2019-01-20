class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        var refactory = 0
        
        for i in 0 ..< max(a.count, b.count) {
            var ai = 0, bi = 0
            if i < a.count {
                ai = Int(String(a[a.index(a.startIndex, offsetBy: a.count - 1 - i)]))!
            }
            if i < b.count {
                bi = Int(String(b[b.index(b.startIndex, offsetBy: b.count - 1 - i)]))!
            }
            
            let val = ai + bi + refactory
            result = "\(val % 2)" + result
            refactory = val / 2
        }
        if refactory == 0 {
            return result
        }
        
        return "1" + result
    }
}
