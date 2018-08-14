class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let queue = PriorityQueue(matrix.count * matrix.count - k + 1)
        matrix.forEach { row in
            row.forEach { item in
                queue.add(item)
            }
        }
        return queue.maxK()
    }
}

class PriorityQueue {

    private let k: Int
    private var heap = [Int]()

    private var size: Int {
        return heap.count - 1
    }

    init(_ k: Int) {
        self.k = k

        heap.append(0)
    }

    func add(_ val: Int) {
        heap.append(val)
        swim(size)

        if size > k {
            deleteMin()
        }
    }

    func maxK() -> Int {
        return heap[1]
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1, less(idx, idx / 2) {
            exchange(idx, idx / 2)
            idx = idx / 2
        }
    }

    private func deleteMin() {
        exchange(1, size)
        heap.removeLast()
        sink(1)
    }

    private func sink(_ i: Int) {
        var idx = i
        let sz = size
        while idx * 2 <= sz {
            var childIdx = idx * 2
            if childIdx + 1 <= sz, less(childIdx + 1, childIdx) {
                childIdx += 1
            }
            guard less(childIdx, idx) else {
                break
            }
            exchange(childIdx, idx)
            idx = childIdx
        }
    }

    private func less(_ left: Int, _ right: Int) -> Bool {
        return heap[left] < heap[right]
    }

    private func exchange(_ i: Int, _ j: Int) {
        (heap[i], heap[j]) = (heap[j], heap[i])
    }

}
