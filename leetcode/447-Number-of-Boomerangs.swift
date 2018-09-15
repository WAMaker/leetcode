class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var dict = [Int: Int]()
        var result = 0

        for (i, p1) in points.enumerated() {
            for (j, p2) in points.enumerated() {
                if i == j {
                    continue
                }
                let distance = getDistances(p1, p2)
                if let count = dict[distance] {
                    dict[distance] = count + 1
                } else {
                    dict[distance] = 1
                }
            }

            dict.values.forEach { value in
                result += value * (value - 1)
            }

            dict = [:]
        }

        return result
    }

    private func getDistances(_ p1: [Int], _ p2: [Int]) -> Int {
        let diffx = p1[0] - p2[0]
        let diffy = p1[1] - p2[1]
        return diffx * diffx + diffy * diffy
    }
}
