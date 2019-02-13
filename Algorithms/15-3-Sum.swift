class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        let nums = nums.sorted()
        var result = [[Int]]()
        var idx = 0

        while idx < count - 2 {
            var start = idx + 1
            var end = count - 1

            while start < end {
                let sum = nums[idx] + nums[start] + nums[end]

                if sum == 0 {
                    result.append([nums[idx], nums[start], nums[end]])
                }

                if sum > 0 {
                    let val = nums[end]
                    while start < end, val == nums[end] {
                        end -= 1
                    }
                } else {
                    let val = nums[start]
                    while start < end, val == nums[start] {
                        start += 1
                    }
                }
            }

            let val = nums[idx]
            while idx < count - 2, val == nums[idx] {
                idx += 1
            }
        }

        return result
    }
}
