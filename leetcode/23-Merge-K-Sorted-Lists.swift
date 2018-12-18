/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var lists = lists

        while lists.count > 1 {
            let first = lists.removeFirst()
            let second = lists.removeFirst()
            let merged = merge2Lists(first, second)
            lists.append(merged)
        }

        return lists[0]
    }

    func merge2Lists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var cursor1 = l1
        var cursor2 = l2
        var result = ListNode(0)
        var node: ListNode? = result

        while let c1 = cursor1, let c2 = cursor2 {
            if c1.val > c2.val {
                node?.next = c2
                cursor2 = c2.next
            } else {
                node?.next = c1
                cursor1 = c1.next
            }
            node = node?.next
        }
        if cursor1 != nil {
            node?.next = cursor1
        }
        if cursor2 != nil {
            node?.next = cursor2
        }

        return result.next
    }
}
