class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let set = Set(nums)
        if set.count == 1 && set.first! == 0 {
            return "0"
        }
        let sorted = nums.sorted { (lhs, rhs) -> Bool in
            let str1 = "\(lhs)"
            let str2 = "\(rhs)"
            return str1 + str2 > str2 + str1
        }
        return sorted.reduce("") { "\($0)" + "\($1)" }
    }
}
