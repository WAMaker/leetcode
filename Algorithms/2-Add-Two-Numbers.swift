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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 ?? l2
        }

        var cursor1 = l1
        var cursor2 = l2
        var carry = 0

        while true {
            if cursor1 == nil, cursor2 == nil {
                break
            }

            let val1 = cursor1?.val ?? 0
            let val2 = cursor2?.val ?? 0
            let result = val1 + val2 + carry
            carry = result / 10

            cursor1?.val = result % 10

            if cursor1?.next == nil {
                if let next = cursor2?.next {
                    cursor1?.next = next
                    cursor2?.next = nil
                } else if carry > 0 {
                    cursor1?.next = ListNode(carry)
                    carry = 0
                }
            }

            cursor1 = cursor1?.next
            cursor2 = cursor2?.next
        }

        return l1
    }
}
