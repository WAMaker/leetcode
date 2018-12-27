class Solution {

    private var heap = [Element]()

    func frequencySort(_ s: String) -> String {
        if s.count < 2 {
            return s
        }

        let first = Element(c: Character(" "), count: 0)
        heap = [first]
        heap.reserveCapacity(s.count + 1)

        var dic = [Character: Int]()
        s.forEach { c in
            if let num = dic[c] {
                dic[c] = num + 1
            } else {
                dic[c] = 1
            }
        }
        dic.forEach { key, val in
            let ele = Element(c: key, count: val)
            heap.append(ele)
        }

        heapSort()

        return heap.reduce("") {
            $0 + String(repeating: $1.c, count: $1.count)
        }
    }

    private func heapSort() {
        let halfIdx = (heap.count - 1) / 2
        if halfIdx > 1 {
            for i in (1...halfIdx).reversed() {
                sink(i, lastIdx: heap.count - 1)
            }
        } else {
            sink(1, lastIdx: heap.count - 1)
        }

        var lastIdx = heap.count - 1
        while lastIdx > 1 {
            exchange(1, lastIdx)
            lastIdx -= 1
            sink(1, lastIdx: lastIdx)
        }
    }

    private func sink(_ idx: Int, lastIdx: Int) {
        var i = idx
        while i * 2 <= lastIdx {
            var childIdx = i * 2
            if childIdx + 1 <= lastIdx, heap[childIdx].count > heap[childIdx + 1].count {
                childIdx += 1
            }
            if heap[i].count <= heap[childIdx].count {
                break
            }
            exchange(i, childIdx)
            i = childIdx
        }
    }

    private func exchange(_ former: Int, _ latter: Int) {
        (heap[former], heap[latter]) = (heap[latter], heap[former])
    }

}

struct Element {
    let c: Character
    let count: Int
}
