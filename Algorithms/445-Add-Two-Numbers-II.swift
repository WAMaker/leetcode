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
        let (rl1, count1) = reverseList(l1)
        let (rl2, count2) = reverseList(l2)

        var cursor1: ListNode?
        var cursor2: ListNode?
        var extraVal = 0
        if count1 > count2 {
            cursor1 = rl1
            cursor2 = rl2
        } else {
            cursor1 = rl2
            cursor2 = rl1
        }
        let newHead = cursor1

        while cursor1 != nil {
            let val = cursor1!.val + extraVal + (cursor2?.val ?? 0)
            cursor1!.val = val % 10
            extraVal = val / 10
            if cursor1?.next == nil, extraVal > 0 {
                let tail = ListNode(extraVal)
                cursor1?.next = tail
                break
            }
            cursor1 = cursor1?.next
            cursor2 = cursor2?.next
        }

        let (result, _) = reverseList(newHead)
        return result
    }

    private func reverseList(_ head: ListNode?) -> (ListNode?, Int) {
        var pre: ListNode?
        var node = head
        var count = 0

        while node != nil {
            count += 1
            let next = node?.next
            node?.next = pre
            pre = node
            node = next
        }

        return (pre, count)
    }
}
