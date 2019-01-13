class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var nums = [Int]()

        tokens.forEach { token in
            switch token {
            case "+":
                let n1 = nums.removeLast()
                let n2 = nums.removeLast()
                nums.append(n2 + n1)
            case "-":
                let n1 = nums.removeLast()
                let n2 = nums.removeLast()
                nums.append(n2 - n1)
            case "*":
                let n1 = nums.removeLast()
                let n2 = nums.removeLast()
                nums.append(n2 * n1)
            case "/":
                let n1 = nums.removeLast()
                let n2 = nums.removeLast()
                nums.append(n2 / n1)
            default:
                if let num = Int(token) {
                    nums.append(num)
                }
            }
        }

        return nums[0]
    }
}
