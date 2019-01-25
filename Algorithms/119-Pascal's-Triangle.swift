class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        var pre = [1]
        var result = [1]
        
        for i in 1 ... rowIndex {
            for i in 0 ..< pre.count - 1 {
                result.append(pre[i] + pre[i + 1])
            }
            
            result.append(1)
            pre = result
            result = [1]
        }
        
        return pre
    }
}
