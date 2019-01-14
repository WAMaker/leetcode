
class MinStack {

    private var stack = [Int]()
    private var min = [Int]()

    /** initialize your data structure here. */
    init() {

    }

    func push(_ x: Int) {
        stack.append(x)

        if min.isEmpty || min.last! > x {
            min.append(x)
        } else {
            min.append(min.last!)
        }
    }

    func pop() {
        stack.removeLast()
        min.removeLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return min.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

