/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
	ListNode *detectCycle(ListNode *head) {
		ListNode *fast = head;
		ListNode *slow = head;
		
		while (fast and fast -> next) {
			fast = fast -> next -> next;
			slow = slow -> next;
			
			if (fast != slow) {
				continue;
			}
			
			fast = head;
			while (fast != slow) {
				fast = fast -> next;
				slow = slow -> next;
			}
			return fast;
		}
		
		return NULL;
	}
};