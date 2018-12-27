class Solution {
    var lastIndex: Int?
    var sorted = [Int]()

    func hIndex(_ citations: [Int]) -> Int {
        if citations.isEmpty {
            return 0
        }
        sorted = citations.sorted()
        let count = sorted.count
        var hIndex = 0
        for idx in 0..<count {
            if let n_idx = nextIndexBigger(than: idx + 1) {
                if count - n_idx >= idx + 1 {
                    hIndex = idx + 1
                }
            } else {
                break
            }
        }
        return hIndex
    }

    func nextIndexBigger(than value: Int) -> Int? {
        let startSearchIndex = lastIndex ?? 0
        for idx in startSearchIndex..<sorted.count {
            if sorted[idx] >= value {
                lastIndex = idx
                return idx
            }
        }
        return nil
    }
}
