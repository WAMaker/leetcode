class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dic = [String: Int]()
        words.forEach { word in
            if let count = dic[word] {
                dic[word] = count + 1
            } else {
                dic[word] = 1
            }
        }
        let queue = PriorityQueue(k)
        dic.forEach { key, val in
            let ele = Element(str: key, count: val)
            queue.add(ele)
        }
        return queue.heapSort()
    }
}

class PriorityQueue {

    private let k: Int
    private var heap = [Element]()

    private var size: Int {
        return heap.count - 1
    }

    init(_ k: Int) {
        self.k = k

        let first = Element(str: "", count: 0)
        heap.append(first)
    }

    func add(_ val: Element) {
        heap.append(val)
        swim(size)
    }

    func heapSort() -> [String] {
        var results = [String]()
        while results.count < k {
            results.append(deleteMax())
        }
        return results
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1 {
            if less(idx, idx / 2) {
                break
            }
            exchange(idx, idx / 2)
            idx = idx / 2
        }
    }

    private func deleteMax() -> String {
        exchange(1, size)
        let max = heap.removeLast()
        sink(1)
        return max.str
    }

    private func sink(_ i: Int) {
        var idx = i
        let sz = size
        while idx * 2 <= sz {
            var childIdx = idx * 2
            if childIdx + 1 <= sz, less(childIdx, childIdx + 1) {
                childIdx += 1
            }
            guard less(idx, childIdx) else {
                break
            }
            exchange(childIdx, idx)
            idx = childIdx
        }
    }

    private func less(_ left: Int, _ right: Int) -> Bool {
        if heap[left].count < heap[right].count {
            return true
        }
        if heap[left].count == heap[right].count, heap[left].str.lowercased() > heap[right].str.lowercased() {
            return true
        }
        return false
    }

    private func exchange(_ i: Int, _ j: Int) {
        (heap[i], heap[j]) = (heap[j], heap[i])
    }

}

struct Element {
    let str: String
    let count: Int
}
