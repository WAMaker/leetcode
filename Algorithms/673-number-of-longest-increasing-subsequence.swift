class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var cntList = [Int](repeating: 1, count: nums.count)
        var stepList = [Int](repeating: 1, count: nums.count)
        var maxCnt = 1

        for i in 1 ..< nums.count {
            var cnt = cntList[i]
            var step = stepList[i]

            for j in 0 ..< i where nums[j] < nums[i] {
                if cntList[j] + 1 > cnt {
                    cnt = cntList[j] + 1
                    step = stepList[j]
                } else if cntList[j] + 1 == cnt {
                    step = step + stepList[j]
                }
            }

            cntList[i] = cnt
            stepList[i] = step
            maxCnt = max(maxCnt, cnt)
        }

        var res = 0
        for (i, cnt) in cntList.enumerated() where cnt == maxCnt {
            res += stepList[i]
        }
        
        return res
    }
}
