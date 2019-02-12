class Solution {
    func decodeString(_ s: String) -> String {
        let ss = s.map(String.init)
        var stack = [String]()
        var result = ""

        ss.forEach {
            if $0 == "]" {
                var str = ""
                while let last = stack.last, last != "[" {
                    str = last + str
                    stack.removeLast()
                }
                stack.removeLast()

                var numStr = ""
                while let last = stack.last, last >= "0", last <= "9" {
                    numStr = last + numStr
                    stack.removeLast()
                }

                guard let num = Int(numStr) else {
                    return
                }

                var tmp = ""
                for _ in 0 ..< num {
                    tmp += str
                }

                stack.append(tmp)
            } else {
                stack.append($0)
            }
        }

        return stack.joined(separator: "")
    }
}
