class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }

        var profit = 0
        var holding = prices[0]

        for i in 1 ..< prices.count {
            profit = max(profit, prices[i] - holding)
            holding = min(holding, prices[i])
        }

        return profit
    }
}
