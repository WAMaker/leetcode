class LRUCache {

    private let capacity: Int
    private var count = 0

    private var dict = [Int: LRUCacheNode]()
    private var head: LRUCacheNode?
    private var tail: LRUCacheNode?

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(node.key)
            insert(node)
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(key)
            insert(node)
        } else {
            let node = LRUCacheNode(key, value)
            dict[key] = node
            if count == capacity, let tailKey = tail?.key {
                remove(tailKey)
                dict.removeValue(forKey: tailKey)
            }
            insert(node)
        }
    }

    private func insert(_ node: LRUCacheNode) {
        if count == 0 {
            head = node
            tail = node
        } else {
            node.next = head
            head?.pre = node
            head = node
        }
        count += 1
    }

    @discardableResult
    private func remove(_ key: Int) -> LRUCacheNode? {
        guard count > 0, let node = dict[key] else {
            return nil
        }
        if count == 1 {
            head = nil
            tail = nil
        } else if head!.key == node.key {
            head = node.next
            head?.pre = nil
        } else if tail!.key == node.key {
            tail = node.pre
            tail?.next = nil
        } else {
            node.pre?.next = node.next
            node.next?.pre = node.pre
        }
        node.next = nil
        node.pre = nil
        count -= 1
        return node
    }

}

fileprivate class LRUCacheNode {

    let key: Int
    var val: Int

    var pre: LRUCacheNode?
    var next: LRUCacheNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }

}
