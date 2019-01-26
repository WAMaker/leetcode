class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.isEmpty {
            return
        }
        let k = k % nums.count
        var start = 0
        var changed = 0

        while changed < nums.count {
            var current = start
            var tmp = nums[current]

            repeat {
                let next = (current + k) % nums.count
                let nextTmp = nums[next]
                nums[next] = tmp
                current = next
                changed += 1
                tmp = nextTmp
            } while current != start && changed < nums.count

            start += 1
        }
    }
}
