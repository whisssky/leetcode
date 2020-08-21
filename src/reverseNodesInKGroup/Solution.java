package reverseNodesInKGroup;

//https://leetcode-cn.com/problems/reverse-nodes-in-k-group/


import commonModel.ListNode;

public class Solution {

	//思想:每次找到第k的,进行反转操作,再往后找k个,以此类推。用临时变量保存每组的头，尾等信息
	public ListNode reverseKGroup(ListNode head, int k) {
		ListNode n = head;
		ListNode first = head;
		ListNode last = null;
		ListNode newHead = null;
		int count = 0;
		while(n!=null){
			count++;
			if(count==k){
				ListNode temp1 = n.next;
				ListNode pre = null;
				ListNode p = first;
				ListNode curLast = null;
				ListNode curfirst = null;
				for(int i=0;i<k;i++){
					if(i==k-1){
						curLast = p;
					}
					ListNode temp = p.next;
					p.next = pre;
					pre = p;
					p = temp;
				}
				if(last!=null){
					last.next = curLast;
				}
				if(newHead==null){
					newHead = curLast;
				}
				last = first;
				n = temp1;
				first = n;
				count=0;
			}
			else{
				n = n.next;
			}
		}
		if(count>0&&last!=null){
			last.next = first;
		}
		return newHead==null?head:newHead;
	}
}
