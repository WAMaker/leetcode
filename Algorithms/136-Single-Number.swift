class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) {
            return $0 ^ $1
        }
    }
}
