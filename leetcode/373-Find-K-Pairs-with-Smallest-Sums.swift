class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        let pq = PriorityQueue(k)
        nums1.forEach { num1 in
            nums2.forEach { num2 in
                pq.add((num1, num2))
            }
        }
        return pq.heapSort()
    }
}

class PriorityQueue {

    typealias Element = (Int, Int)

    private let k: Int
    private var heap = [Element]()

    private var size: Int {
        return heap.count - 1
    }

    init(_ k: Int) {
        self.k = k
        self.heap.append((0, 0))
    }

    func add(_ ele: Element) {
        if size >= k, ele.0 + ele.1 > heap[1].0 + heap[1].1 {
            return
        }

        heap.append(ele)
        swim(size)

        if size > k {
            deleMax()
        }
    }

    func heapSort() -> [[Int]] {
        var result = [[Int]]()
        while let ele = deleMax() {
            result.insert([ele.0, ele.1], at: 0)
        }
        return result
    }

    @discardableResult
    private func deleMax() -> Element? {
        if size == 0 {
            return nil
        }
        exchange(1, size)
        let result = heap.removeLast()
        sink(1)
        return result
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1, less(idx / 2, idx) {
            exchange(idx / 2, idx)
            idx /= 2
        }
    }

    private func sink(_ i: Int) {
        var idx = i
        while idx * 2 <= size {
            var childIdx = idx * 2
            if childIdx + 1 <= size, less(childIdx, childIdx + 1) {
                childIdx += 1
            }
            if less(childIdx, idx) {
                return
            }
            exchange(childIdx, idx)
            idx = childIdx
        }
    }

    private func less(_ i: Int, _ j: Int) -> Bool {
        guard i <= size && j <= size else {
            return false
        }
        return (heap[i].0 + heap[i].1) < (heap[j].0 + heap[j].1)
    }

    private func exchange(_ i: Int, _ j: Int) {
        guard i <= size && j <= size else {
            return
        }
        (heap[i], heap[j]) = (heap[j], heap[i])
    }

}
