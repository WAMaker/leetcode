class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        var set = Set<Int>()

        candies.forEach {
            set.insert($0)
        }

        return min(set.count, candies.count / 2)
    }
}
