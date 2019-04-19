class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        
        prices.forEach { price in
            minPrice = min(price, minPrice)
            maxProfit = max(maxProfit, price - minPrice)
        }
        
        return maxProfit
    }
}