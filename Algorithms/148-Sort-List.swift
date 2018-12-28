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
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return head
        }

        let middle = findMiddleNode(head)
        let left = sortList(head)
        let right = sortList(middle)

        return merge(left, right)
    }

    private func findMiddleNode(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var slow = head
        var fast = head

        while fast?.next != nil {
            pre = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        pre?.next = nil

        return slow
    }

    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        if l1.val < l2.val {
            l1.next = merge(l1.next, l2)
            return l1
        } else {
            l2.next = merge(l1, l2.next)
            return l2
        }
    }
}
