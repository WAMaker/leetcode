
class MyCircularQueue {

    private let k: Int
    private var head = 0
    private var tail = 0
    private var count = 0

    private var queue: [Int]

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        self.k = k
        self.queue = Array(repeating: 0, count: k)
    }
    /** Insert an element into the circular queue. Return true if the operation is successful. */

    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        if isEmpty() {
            queue[tail] = value
        } else {
            tail = (tail + 1) % k
            queue[tail] = value
        }
        count += 1
        return true
    }
    /** Delete an element from the circular queue. Return true if the operation is successful. */

    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        count -= 1
        if !isEmpty() {
            head = (head + 1) % k
        }
        return true
    }
    /** Get the front item from the queue. */

    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[head]
    }
    /** Get the last item from the queue. */

    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[tail]
    }
    /** Checks whether the circular queue is empty or not. */

    func isEmpty() -> Bool {
        return count == 0
    }
    /** Checks whether the circular queue is full or not. */

    func isFull() -> Bool {
        return count == k
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */

