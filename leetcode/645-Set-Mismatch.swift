class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        for i in 1 ... nums.count {
            set.insert(i)
        }

        var twiceNumber = 0
        nums.forEach { num in
            if set.contains(num) {
                set.remove(num)
            } else {
                twiceNumber = num
            }
        }

        return [twiceNumber, set.first!]
    }
}
