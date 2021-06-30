class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let heights = envelopes
            .sorted {
                $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]
            }
            .map { $0[1] }

        var res: [Int] = []
        
        for height in heights {
            if let index = binarySearchFirstLargerIndex(for: height, in: res) {
                    res[index] = height
                } else {
                    res.append(height)
                }
        }

        return res.count
    }

    private func binarySearchFirstLargerIndex(for height: Int, in heights: [Int]) -> Int? {
        if heights.isEmpty {
            return nil
        }

        var start = 0
        var end = heights.count - 1

        while start <= end {
            let mid = start + (end - start) / 2
            if heights[mid] < height {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }

        if start >= heights.count {
            return nil
        }

        return start
    }
}
