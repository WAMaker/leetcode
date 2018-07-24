class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var numDict = [Int: Int]()
        var result = [Int]()

        for num in nums1 {
            if let value = numDict[num] {
                numDict[num] = value + 1
            } else {
                numDict[num] = 1
            }
        }

        for num in nums2 {
            if let value = numDict[num], value != 0 {
                result.append(num)
                numDict[num] = value - 1
            }
        }

        return result
    }
}
