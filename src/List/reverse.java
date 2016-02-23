package List;

import java.util.ArrayList;
import java.util.LinkedList;

public class reverse {

	

	public static ListNode reverseList(ListNode head) {
		
		ListNode curr = head;
		ListNode next = null;
		ListNode pre = null;
		while(curr != null)
		{
			next = curr.next;
			curr.next = pre;
			pre = curr;
			curr = next;
		}

		return pre;

	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ListNode a = new ListNode(3);
		a = a.install(1, 2, 3, 4, 5);
		a = reverseList(a);
		System.out.println(a.val+" "+a.next.val+" "+a.next.next.val+" "+a.next.next.next.val+" "+a.next.next.next.next.val);

	}




}
