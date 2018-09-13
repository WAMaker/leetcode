class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()

        for (i, num) in nums.enumerated() {
            guard set.insert(num).0 else {
                return true
            }
            guard i >= k else {
                continue
            }
            set.remove(nums[i - k])
        }

        return false
    }
}
