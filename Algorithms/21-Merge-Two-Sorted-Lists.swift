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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }

        var cursor1 = l1
        var cursor2 = l2

        var result: ListNode?
        var head: ListNode?

        while true {
            if cursor1 == nil {
                result?.next = cursor2
                break
            }
            if cursor2 == nil {
                result?.next = cursor1
                break
            }

            let tmp: ListNode?
            if cursor1!.val > cursor2!.val {
                tmp = cursor2
                cursor2 = cursor2?.next
            } else {
                tmp = cursor1
                cursor1 = cursor1?.next
            }

            tmp?.next = nil
            if result == nil {
                result = tmp
                head = tmp
            } else {
                result?.next = tmp
                result = result?.next
            }
        }

        return head
    }
}
