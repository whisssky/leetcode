package SwapNodesinPairs;

/*
     https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 */
public class Solution {
	public static void main(String[] args) {
		Solution solution = new Solution();
		ListNode a1 = new ListNode(1);
		ListNode a2 = new ListNode(2);
		a1.next = a2;
		ListNode aa = solution.swapPairs(a1);
		System.out.println();


	}

	public ListNode swapPairs(ListNode head) {
		ListNode pre = null;
		ListNode pree = null;
		ListNode cur = head;
		int i = 0;
		while(cur!=null){
			i++;
			if(i%2!=0){
				pree = pre;
				pre = cur;
				cur = cur.next;
				continue;
			}
			pre.next = cur.next;
			cur.next = pre;
			if(pree!=null){
				pree.next = cur;
			}
			else {
				head = cur;
			}
			pree = cur;
			cur = pre.next;
		}
		return head;
	}

}
