class Solution {
    func reorganizeString(_ S: String) -> String {
        var cdic: [Character: Int] = [: ]
        S.forEach { c in
            if let cnum = cdic[c] {
                cdic[c] = cnum + 1
            } else {
                cdic[c] = 1
            }
        }

        let queue = PriorityQueue()
        cdic.forEach { c, num in
            let ele = Element(c: c, num: num)
            queue.add(ele)
        }

        var result = ""
        while true {
            guard let max = queue.deleteMax() else {
                break
            }
            if let secondMax = queue.deleteMax() {
                result.append(max.c)
                result.append(secondMax.c)
                max.num -= 1
                queue.add(max)
                secondMax.num -= 1
                queue.add(secondMax)
            } else {
                if max.num > 1 {
                    return ""
                } else {
                    result.append(max.c)
                    break
                }
            }
        }
        return result
    }
}

class PriorityQueue {

    private var heap = [Element]()

    var size: Int {
        return heap.count - 1
    }

    init() {
        let zero = Element(c: Character("a"), num: 0)
        heap.append(zero)
    }

    func add(_ ele: Element) {
        if ele.num <= 0 {
            return
        }
        heap.append(ele)
        swim(size)
    }

    func deleteMax() -> Element? {
        let sz = size
        if sz == 0 {
            return nil
        }
        exchange(1, sz)
        let last = heap.removeLast()
        sink(1)
        return last
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1, less(idx / 2, idx) {
            exchange(idx, idx / 2)
            idx = idx / 2
        }
    }

    private func sink(_ i: Int) {
        let sz = size
        var idx = i
        while idx * 2 <= sz {
            var childIdx = idx * 2
            if childIdx + 1 <= sz, less(childIdx, childIdx + 1) {
                childIdx += 1
            }
            if less(childIdx, idx) {
                break
            }
            exchange(idx, childIdx)
            idx = childIdx
        }
    }

    private func less(_ left: Int, _ right: Int) -> Bool {
        if heap[left].num < heap[right].num {
            return true
        }
        if heap[left].num == heap[right].num {
            return heap[left].c < heap[right].c
        }
        return false
    }

    private func exchange(_ former: Int, _ latter: Int) {
        guard former <= size && latter <= size else {
            return
        }
        (heap[former], heap[latter]) = (heap[latter], heap[former])
    }

}

class Element {
    let c: Character
    var num: Int

    init(c: Character, num: Int) {
        self.c = c
        self.num = num
    }
}
