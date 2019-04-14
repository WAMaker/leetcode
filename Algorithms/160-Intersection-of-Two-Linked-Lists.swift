/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
	const la = getListLength(headA), lb = getListLength(headB)

	let lc, sc, lenDiff
	if (la > lb) {
		lc = headA
		sc = headB
		lenDiff = la - lb
	} else {
		lc = headB
		sc = headA
		lenDiff = lb - la
	}
	
	for (let i = 0; i < lenDiff; i++) {
		lc = lc.next
	}

	let result = null
	while (sc !== null) {
		if (sc === lc) {
			return lc
		}
		sc = sc.next
		lc = lc.next
	}
	
	return null
};

var getListLength = function(head) {
	let cursor = head
	let len = 0
	while (cursor !== null) {
		len++
		cursor = cursor.next
	}
	return len
};