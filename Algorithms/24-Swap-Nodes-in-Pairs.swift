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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var node = head
        var newHead: ListNode?
        var newCursor: ListNode?

        while let current = node, let next = node?.next {
            let cursor = next.next
            next.next = nil
            let reversed = reverse(current)
            if newHead == nil {
                newHead = reversed
                newCursor = reversed?.next
            } else {
                newCursor?.next = reversed
                newCursor = newCursor?.next?.next
            }
            node = cursor
        }

        if newHead == nil {
            newHead = head
        }
        if node != nil {
            newCursor?.next = node
        }

        return newHead
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var node = head

        while node != nil {
            let next = node?.next
            node?.next = pre
            pre = node
            node = next
        }

        return pre
    }
}
