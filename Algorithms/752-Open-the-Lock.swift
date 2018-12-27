class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let initial = "0000"
        let mapUp = [
            Character("0"): Character("9"), Character("1"): Character("0"), Character("2"): Character("1"),
            Character("3"): Character("2"), Character("4"): Character("3"), Character("5"): Character("4"),
            Character("6"): Character("5"), Character("7"): Character("6"), Character("8"): Character("7"),
            Character("9"): Character("8")
        ]
        let mapDown = [
            Character("0"): Character("1"), Character("1"): Character("2"), Character("2"): Character("3"),
            Character("3"): Character("4"), Character("4"): Character("5"), Character("5"): Character("6"),
            Character("6"): Character("7"), Character("7"): Character("8"), Character("8"): Character("9"),
            Character("9"): Character("0")
        ]

        let deadendsSet = Set(deadends)
        if deadendsSet.contains(initial) {
            return -1
        }

        var visited: Set<String> = [initial]
        let priority = calculatePriority(initial, with: target)
        let pq = MinPQ()
        pq.add(Lock(state: initial, steps: 0, priority: priority))

        while let lock = pq.deleteMin() {
            print(lock)
            if lock.state == target {
                return lock.steps
            }

            let state = lock.state
            let steps = lock.steps + 1
            for i in 0 ..< lock.state.count {
                let start = state.index(state.startIndex, offsetBy: i)
                let end = state.index(state.startIndex, offsetBy: i + 1)

                var tmpLock = state
                var replacement = mapUp[state[start]]!
                tmpLock.replaceSubrange(start..<end, with: [replacement])
                if !visited.contains(tmpLock) && !deadendsSet.contains(tmpLock) {
                    let priority = calculatePriority(tmpLock, with: target)
                    pq.add(Lock(state: tmpLock, steps: steps, priority: priority + steps))
                    visited.insert(tmpLock)
                }

                replacement = mapDown[state[start]]!
                tmpLock.replaceSubrange(start..<end, with: [replacement])
                if !visited.contains(tmpLock) && !deadendsSet.contains(tmpLock) {
                    let priority = calculatePriority(tmpLock, with: target)
                    pq.add(Lock(state: tmpLock, steps: steps, priority: priority + steps))
                    visited.insert(tmpLock)
                }
            }
        }

        return -1
    }

    private func calculatePriority(_ state: String, with target: String) -> Int {
        var priority = 0
        for i in 0..<4 {
            let idx = state.index(state.startIndex, offsetBy: i)
            priority += abs(Int(String(state[idx]))! - Int(String(target[idx]))!)
        }
        return priority
    }
}

class MinPQ {

    private var heap = [Lock]()
    private var size: Int {
        return heap.count - 1
    }

    init() {
        heap.append(Lock(state: "", steps: 0, priority: 0))
    }

    func add(_ lock: Lock) {
        heap.append(lock)
        swim(size)
    }

    func deleteMin() -> Lock? {
        if size == 0 {
            return nil
        }
        exchange(1, size)
        let last = heap.removeLast()
        sink(1)
        return last
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1 && less(idx, idx / 2) {
            exchange(idx, idx / 2)
            idx /= 2
        }
    }

    private func sink(_ i: Int) {
        let sz = size
        var idx = i
        while idx * 2 <= sz {
            var child = idx * 2
            if child + 1 <= sz, less(child + 1, child) {
                child += 1
            }
            if less(idx, child) {
                break
            }
            exchange(idx, child)
            idx = child
        }
    }

    private func less(_ left: Int, _ right: Int) -> Bool {
        return heap[left].priority < heap[right].priority
    }

    private func exchange(_ left: Int, _ right: Int) {
        (heap[left], heap[right]) = (heap[right], heap[left])
    }

}

struct Lock {
    let state: String
    let steps: Int
    let priority: Int
}
