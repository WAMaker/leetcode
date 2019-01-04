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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var pre: ListNode?

        while let current = node {
            var next = current.next
            current.next = pre
            pre = current
            node = next
        }

        return pre
    }
}
