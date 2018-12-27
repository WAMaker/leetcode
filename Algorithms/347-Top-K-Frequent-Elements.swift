class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numDic = [Int: Int]()
        nums.forEach { num in
            if let count = numDic[num] {
                numDic[num] = count + 1
            } else {
                numDic[num] = 1
            }
        }

        let queue = PriorityQueue(k)
        numDic.forEach { key, val in
            let ele = Element(num: key, count: val)
            queue.add(ele)
        }

        return queue.elements()
    }
}

class PriorityQueue {

    var size: Int {
        return heap.count - 1
    }

    private let k: Int
    private var heap = [Element]()

    init(_ k: Int) {
        self.k = k
        self.heap.append(Element(num: 0, count: 0))
    }

    func add(_ val: Element) {
        heap.append(val)
        swim(size)
        if size > k {
            deleteMin()
        }
    }

    func elements() -> [Int] {
        var results = [Int]()
        heap[1...].forEach { ele in
            results.append(ele.num)
        }
        return results
    }

    private func deleteMin() {
        exchange(1, size)
        heap.removeLast()
        sink(1)
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1 {
            let parentIdx = idx / 2
            if heap[idx].count >= heap[parentIdx].count {
                break
            }
            exchange(idx, parentIdx)
            idx = parentIdx
        }
    }

    private func sink(_ i: Int) {
        var idx = i
        while idx * 2 <= size {
            var childIdx = idx * 2
            if childIdx + 1 <= size, heap[childIdx].count > heap[childIdx + 1].count {
                childIdx += 1
            }
            if heap[idx].count <= heap[childIdx].count {
                break
            }
            exchange(idx, childIdx)
            idx = childIdx
        }
    }

    private func exchange(_ i: Int, _ j: Int) {
        (heap[i], heap[j]) = (heap[j], heap[i])
    }

}

struct Element {
    let num: Int
    let count: Int
}
