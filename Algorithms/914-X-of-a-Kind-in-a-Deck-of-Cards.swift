class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        if deck.isEmpty {
            return false
        }

        var dict: [Int: Int] = [: ]
        deck.forEach {
            dict[$0, default: 0] += 1
        }

        let countSet = Set(dict.values)
        if countSet.contains(1) {
            return false
        }

        var num = 1
        while true {
            num += 1
            var satisfyCount = 0
            for count in countSet {
                if num > count {
                    return false
                }
                if count % num != 0 {
                    break
                }
                satisfyCount += 1
            }
            if satisfyCount == countSet.count {
                return true
            }
        }
    }

}
