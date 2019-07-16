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
	func nextLargerNodes(_ head: ListNode?) -> [Int] {
		var stack = [Int]()
		var result = [Int]()
		var node = reverse(node: head)
		
		while let current = node {
			while let last = stack.last, last <= current.val {
				stack.removeLast()
			}
			if let last = stack.last {
				result.append(last)
			} else {
				result.append(0)
			}
			stack.append(current.val)
			node = node?.next
		}
		
		return result.reversed()
	}
	
	private func reverse(node: ListNode?) -> ListNode? {
		var node = node
		var pre: ListNode? = nil
		
		while let current = node {
			let next = node?.next
			current.next = pre
			pre = current
			node = next
		}
		
		return pre
	}
}