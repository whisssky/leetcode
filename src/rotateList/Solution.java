package rotateList;

//https://leetcode-cn.com/problems/rotate-list/

import commonModel.ListNode;

public class Solution {

	//思路:先遍历一次,拿到链表长度,然后k= k取余长度,过滤多次循环重复。然后从头开始遍历到第k个，作为新的头节点。临时变量保存原来的头尾，k个节点的前后节点，用于拼接
	public ListNode rotateRight(ListNode head, int k) {
		if(head==null || head.next==null){
			return head;
		}
		ListNode p = head;
		ListNode p1 = head;
		ListNode tail = head;
		ListNode pre0 = null;
		int count=0;
		while(p!=null){
			pre0 = p;
			p = p.next;
			count++;
		}
		tail  = pre0;
		int realk = k%count;
		if(realk==0){
			return head;
		}
		ListNode pre = null;
		ListNode after = head.next;
		for(int i=0;i<count-realk;i++){
			pre = p1;
			p1 = p1.next;
			after = p1.next;
		}
		tail.next = head;
		pre.next = null;
		return p1;

	}
}
