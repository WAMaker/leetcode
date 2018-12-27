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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var length = 0
        var node = head
        var tail: ListNode?

        while node != nil {
            if node?.next == nil {
                tail = node
            }
            node = node?.next
            length += 1
        }

        if length < 2 || length - k % length == 0 {
            return head
        }

        node = head

        for _ in 0 ..< length - k % length {
            let next = node?.next
            node?.next = nil
            tail?.next = node
            tail = node
            node = next
        }

        return node
    }
}
