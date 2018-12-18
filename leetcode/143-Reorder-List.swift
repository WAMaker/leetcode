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
    func reorderList(_ head: ListNode?) {
        var first = head
        var second = head

        while second?.next != nil {
            first = first?.next
            second = second?.next?.next
        }
        var middle = first
        var secondHead = reverse(middle?.next)
        middle?.next = nil

        first = head
        second = secondHead
        while second != nil {
            let fn = first?.next
            let sn = second?.next
            first?.next = second
            second?.next = fn
            first = fn
            second = sn
        }
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        var node = head
        var pre: ListNode?

        while node != nil {
            let next = node?.next
            node?.next = pre
            pre = node
            node = next
        }

        return pre
    }
}
