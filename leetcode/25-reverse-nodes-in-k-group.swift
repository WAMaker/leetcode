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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k < 2 {
            return head
        }

        var newHead: ListNode?
        var node = head
        var tail: ListNode?

        while node != nil {
            let h = node
            var length = 1
            while length < k, node != nil {
                node = node?.next
                length += 1
            }
            let t = node
            let next = node?.next
            t?.next = nil

            if node == nil {
                if newHead == nil {
                    newHead = h
                } else {
                    tail?.next = h
                }
                break
            }
            print(length)
            let (rh, rt) = reverse(h)
            if tail == nil {
                tail = rt
            } else {
                tail?.next = rh
                tail = rt
            }
            if newHead == nil {
                newHead = rh
            }
            node = next
        }

        return newHead
    }

    private func reverse(_ head: ListNode?) -> (ListNode?, ListNode?) {
        let tail = head
        var node = head
        var pre: ListNode?

        while node != nil {
            let next = node?.next
            node?.next = pre
            pre = node
            node = next
        }

        return (pre, tail)
    }
}
