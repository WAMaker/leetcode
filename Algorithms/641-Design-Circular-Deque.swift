
class MyCircularDeque {

    let k: Int
    private var queue: [Int]
    private var head = 0
    private var tail = 0
    private var count = 0

    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.k = k
        self.queue = Array(repeating: -1, count: k)
    }

    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        if !isEmpty() {
            head = head - 1 < 0 ? k - 1 : head - 1
        }
        queue[head] = value
        count += 1
        return true
    }

    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        if !isEmpty() {
            tail = (tail + 1) % k
        }
        queue[tail] = value
        count += 1
        return true
    }

    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        count -= 1
        if !isEmpty() {
            head = (head + 1) % k
        }
        // print("queue: \(queue) head: \(head) tail: \(tail) count: \(count)")
        return true
    }

    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        count -= 1
        if !isEmpty() {
            tail = tail - 1 < 0 ? k - 1 : tail - 1
        }
        return true
    }

    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[head]
    }

    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[tail]
    }

    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return count == 0
    }

    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return count == k
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */

