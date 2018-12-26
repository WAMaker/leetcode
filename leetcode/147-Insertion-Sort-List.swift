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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }

        var array = [Int]()
        var cursor = head
        while true {
            array.append(cursor.val)
            if let next = cursor.next {
                cursor = next
            } else {
                break
            }
        }
        var nodes = array.sorted().map { ListNode($0) }
        nodes.enumerated().forEach { offset, node in
            if offset == nodes.count - 1 {
                return
            }
            node.next = nodes[offset + 1]
        }
        return nodes.first
    }
}
