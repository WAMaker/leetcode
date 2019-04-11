
class KthLargest {
    
    private let heap: Heap

    init(_ k: Int, _ nums: [Int]) {
        heap = Heap(k: k)
        nums.forEach {
            heap.add($0)
        }
    }
    
    func add(_ val: Int) -> Int {
        return heap.add(val)
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

class Heap {
    
    private let k: Int
    private var nums: [Int]
    private var last = 0
    
    private var size: Int {
        return nums.count - 1
    }
    
    init(k: Int) {
        self.k = k
        self.nums = [Int](repeating: 0, count: k + 2)
    }
    
    @discardableResult
    func add(_ val: Int) -> Int {
        if last == 0 {
            last += 1
            nums[last] = val
            return val
        }
        if last < k || nums[1] <= val {
            last += 1
            nums[last] = val
            swim(last)
        }

        if last > k {
            deleteMin()
        }
        return nums[1]
    }

    private func deleteMin() {
        (nums[1], nums[last]) = (nums[last], nums[1])
        last -= 1
        sink(1)
    }
    
    private func swim(_ idx: Int) {
        var idx = idx
        while nums[idx] < nums[idx >> 1], idx > 1 {
            (nums[idx], nums[idx >> 1]) = (nums[idx >> 1], nums[idx])
            idx = idx >> 1
        }
    }
    
    private func sink(_ idx: Int) {
        var idx = idx
        while idx << 1 <= last {
            var ti = idx << 1
            if ti + 1 <= last, nums[ti] > nums[ti + 1] {
                ti += 1
            }
            if nums[idx] <= nums[ti] {
                break
            }
            (nums[ti], nums[idx]) = (nums[idx], nums[ti])
            idx = ti
        }
    }
    
}