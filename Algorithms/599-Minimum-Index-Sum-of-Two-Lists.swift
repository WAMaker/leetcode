class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var dict = [String: Int]()

        list1.enumerated().forEach {
            dict[$1] = $0
        }

        var minCount = Int.max
        var result = [String]()
        list2.enumerated().forEach {
            guard let count = dict[$1] else {
                return
            }
            let total = count + $0
            if total > minCount {
                return
            }
            if total == minCount {
                result.append($1)
                return
            }
            minCount = total
            result.removeAll()
            result.append($1)
        }

        return result
    }
}
