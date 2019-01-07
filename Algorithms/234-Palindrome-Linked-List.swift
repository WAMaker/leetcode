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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var middle = findMiddleNode(head)
        var reversed = reverse(middle)

        var node = head
        while node?.next != nil {
            if node!.val != reversed!.val {
                return false
            }
            node = node?.next
            reversed = reversed?.next
        }

        return true
    }

    private func findMiddleNode(_ head: ListNode?) -> ListNode? {
        var node1 = head
        var node2 = head

        while node2?.next != nil {
            node1 = node1?.next
            node2 = node2?.next?.next
        }

        return node1
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        var node = head
        var next = node?.next
        var pre: ListNode? = nil

        while node != nil {
            node?.next = pre
            pre = node
            node = next
            next = next?.next
        }

        return pre
    }

}
