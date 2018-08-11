class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        let pq = PriorityQueue(k)
        nums.forEach { num in
            pq.add(num)
            if pq.size() > k {
                pq.deleteMin()
            }
        }
        return pq.smallestInQueue()
    }
}

class PriorityQueue {

    private let k: Int
    private var last = 0
    private var arr = [Int]()

    init(_ k: Int) {
        self.k = k
        arr.append(0)
    }

    func add(_ num: Int) {
        arr.append(num)
        last += 1
        swim(last)
    }

    func size() -> Int {
        return last
    }

    func deleteMin() {
        (arr[1], arr[last]) = (arr[last], arr[1])
        arr.removeLast()
        last -= 1
        sink(1)
    }

    func smallestInQueue() -> Int {
        return arr[1]
    }

    private func swim(_ index: Int) {
        var idx = index
        while idx > 1 && arr[idx / 2] > arr[idx] {
            (arr[idx / 2], arr[idx]) = (arr[idx], arr[idx / 2])
            idx /= 2
        }
    }

    private func sink(_ index: Int) {
        var idx = index
        while idx * 2 <= k {
            var next = idx * 2
            if next < k && arr[next] > arr[next + 1] {
                next += 1
            }
            if (arr[idx] < arr[next]) {
                break
            }
            (arr[idx], arr[next]) = (arr[next], arr[idx])
            idx = next
        }
    }

}
