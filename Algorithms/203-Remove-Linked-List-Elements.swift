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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        guard head.val != val else {
            return removeElements(head.next, val)
        }
        head.next = removeElements(head.next, val)
        return head
    }
}
