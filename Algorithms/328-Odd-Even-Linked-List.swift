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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var evenHead = head
        var oddHead = head?.next
        var cursorEven = evenHead
        var cursorOdd = oddHead

        while cursorEven != nil {
            cursorEven?.next = cursorEven?.next?.next
            cursorOdd?.next = cursorOdd?.next?.next

            if cursorEven?.next == nil {
                cursorEven?.next = oddHead
                break
            }

            cursorEven = cursorEven?.next
            cursorOdd = cursorOdd?.next
        }

        return evenHead
    }
}
