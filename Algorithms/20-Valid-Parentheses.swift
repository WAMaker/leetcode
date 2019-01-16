class Solution {
    func isValid(_ s: String) -> Bool {
        let map = [
            Character("("): Character(")"),
            Character("["): Character("]"),
            Character("{"): Character("}")
        ]
        let keySet = Set(map.keys)
        var stack = [Character]()

        for c in s {
            if keySet.contains(c) {
                stack.append(c)
            } else if let last = stack.last, let pair = map[last], pair == c {
                stack.removeLast()
            } else {
                return false
            }
        }

        return stack.isEmpty
    }
}
