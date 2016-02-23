package addTwoNumbers;

public class Solution {

	public static void main(String[] args) {
		
		ListNode l1 = new ListNode(2);
		l1.next = new ListNode(8);
		l1.next.next = new ListNode(7);
		ListNode l2 = new ListNode(3);
		l2.next = new ListNode(6);
		l2.next.next = new ListNode(7);
		ListNode a = addTwoNumbers(l1,l2);
		while(a!=null)
		{
			System.out.println(a.val+"   ");
			a=a.next;
		}
		

	}
	
	public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode head = new ListNode(0);
        ListNode p1=l1,p2=l2,p=head;
        int c=0;
        while(p1!=null || p2!=null || c==1)
        {
        	int add1=(p1==null? 0:p1.val);
        	int add2=(p2==null? 0:p2.val);
        	int sum = add1+add2+c;
        	c = sum/10;
        	p.next = new ListNode(sum%10);
        	p = p.next;
        	if(p1!=null)
        		p1=p1.next;
        	if(p2!=null)
        		p2=p2.next;
        }
        return head.next;
    }

}
