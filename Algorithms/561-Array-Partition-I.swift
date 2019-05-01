class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        var sum = 0
        for i in stride(from: 0, to: nums.count, by: +2) {
            sum += sorted[i]
        }
        return sum
    }
}
