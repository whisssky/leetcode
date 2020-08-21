package removeNthNodeFromEndofList;

//https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

import commonModel.ListNode;

public class Solution {

	//思路:用两个指针，一个从头开始跑，一个等跑了n次之后开始从头跑。前一个指针跑到尾的时候，后一个指针就是倒数第n个节点。保存好这个节点的前后节点，用于删除
	public ListNode removeNthFromEnd(ListNode head, int n) {
		if(head==null){
			return head;
		}
		ListNode l = head;
		ListNode save = l;
		ListNode presave = null;
		ListNode aftersave = l.next;
		int count = 1;
		while(l!=null){
			if(count>n){
				presave = save;
				save = save.next;
				aftersave = save.next;
			}
			l = l.next;
			count++;
		}
		if(presave!=null){
			presave.next = aftersave;
		}
		else{
			head = head.next;
		}
		return head;
	}
}
