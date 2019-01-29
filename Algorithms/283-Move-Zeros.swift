class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zi = 0
        var nzi = 0

        while true {
            while zi < nums.count, nums[zi] != 0 {
                zi += 1
            }
            if nzi < zi {
                nzi = zi
            }
            while nzi < nums.count, nums[nzi] == 0 {
                nzi += 1
            }
            guard zi < nums.count, nzi < nums.count else {
                break
            }
            (nums[zi], nums[nzi]) = (nums[nzi], nums[zi])
        }
    }
}
