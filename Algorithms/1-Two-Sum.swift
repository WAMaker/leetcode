class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()

        nums.enumerated().forEach { idx, val in
            dict[val] = idx
        }
        for (idx, val) in nums.enumerated() {
            if let i = dict[target - val], i != idx {
                return [i, idx]
            }
        }

        return []
    }
}
