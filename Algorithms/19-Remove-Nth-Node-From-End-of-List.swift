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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var firstCursor: ListNode? = dummy
        var secondCursor: ListNode? = dummy

        for _ in 0...n {
            firstCursor = firstCursor?.next
        }

        while firstCursor != nil {
            firstCursor = firstCursor?.next
            secondCursor = secondCursor?.next
        }

        secondCursor?.next = secondCursor?.next?.next

        return dummy.next
    }
}
