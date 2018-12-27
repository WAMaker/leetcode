class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = nums[0]
        var slow = nums[0]

        repeat {
            fast = nums[nums[fast]]
            slow = nums[slow]
        } while fast != slow

        fast = nums[0]

        while fast != slow {
            fast = nums[fast]
            slow = nums[slow]
        }

        return fast
    }
}
