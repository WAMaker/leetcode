class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var dict = [Int: Int]()
        for a in A {
            for b in B {
                let sum = a + b
                dict[sum, default: 0] += 1
            }
        }

        var result = 0
        for c in C {
            for d in D {
                let sum = c + d
                if let count = dict[-sum] {
                    result += count
                }
            }
        }

        return result
    }
}
