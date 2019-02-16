class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var counts = Array(repeating: -1, count: amount + 1)
        counts[0] = 0
        for i in 0 ..< amount where counts[i] > -1 {
            let count = counts[i]
            for coin in coins where i + coin <= amount {
                let sum = i + coin
                if counts[sum] < 0 || counts[sum] > counts[i] + 1 {
                    counts[sum] = counts[i] + 1
                }
            }
        }
        return counts[amount]
    }
}
