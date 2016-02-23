package List;

public class ListNode {
	      int val;
	      ListNode next;
	      public ListNode(int x) { val = x; }
	      
	      @SuppressWarnings("null")
		public ListNode install(int a,int b,int c,int d,int e)
	      {
	    	  ListNode node1 = new ListNode(a);
	    	  ListNode node2 = new ListNode(b);
	    	  ListNode node3 = new ListNode(c);
	    	  ListNode node4 = new ListNode(d);
	    	  ListNode node5 = new ListNode(e);
	    			   
	    	  node1.val = a;
	    	  node1.next = node2;
	    	  node2.val = b;
	    	  node2.next = node3;
	    	  node3.val = c;
	    	  node3.next = node4;
	    	  node4.val = d;
	    	  node4.next = node5;
	    	  node5.val = e;
	    	  node5.next = null;
	    	  
	    	  return node1;
	      }
	  
	 }