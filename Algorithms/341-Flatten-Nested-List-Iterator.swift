/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    private var res: [Int] = []
    private var cur = 0

    init(_ nestedList: [NestedInteger]) {
        func collapse(_ nestedList: [NestedInteger]) -> [Int] {
            var ans: [Int] = []
            nestedList.forEach {
                if $0.isInteger() {
                    res.append($0.getInteger())
                    return
                }
                ans.append(contentsOf: collapse($0.getList()))
            }
            return ans
        }

        res.append(contentsOf: collapse(nestedList))
    }
    
    func next() -> Int {
        cur += 1
        return res[cur - 1]
    }
    
    func hasNext() -> Bool {
        return cur < res.count
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */