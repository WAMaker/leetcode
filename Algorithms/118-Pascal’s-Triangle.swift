class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        var results = [[1]]
        if numRows == 1 {
            return results
        }
        
        for i in 1 ..< numRows {
            let row = results[i - 1]
            var tmp = [1]
            
            for j in 0 ..< row.count - 1 {
                tmp.append(row[j] + row[j + 1])
            }
            
            tmp.append(1)
            results.append(tmp)
        }
        
        return results
    }
}
