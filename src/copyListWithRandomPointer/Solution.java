package copyListWithRandomPointer;

/***
 * q138
 * 给定一个链表，每个节点包含一个额外增加的随机指针，该指针可以指向链表中的任何节点或空节点。
 *
 * 要求返回这个链表的 深拷贝。 
 *
 * 我们用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：
 *
 * val：一个表示 Node.val 的整数。
 * random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。
 *  
 *
 * 示例 1：
 *
 *
 *
 * 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 * 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 *
 * 来源：力扣（LeetCode）
 * 链接：https://leetcode-cn.com/problems/copy-list-with-random-pointer
 * 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import commonModel.Node;

import java.util.HashMap;

public class Solution {

	//思路:遍历list的过程中，用一个map存储已创建的节点,key为原节点,value为新节点。
	//每遍历到一个节点时，检查map中是否存在，若存在，则不重复创建新节点，否则则创建，并放入map。
	//然后处理random指针，方法同上
	//一次遍历完即可得结果
	public Node copyRandomList(Node head) {
		if(head==null){
			return head;
		}
		HashMap<Node,Node> nodeMap = new HashMap();
		Node newHead = new Node(head.val);
		nodeMap.put(head,newHead);
		if(head.random!=null){
			if(nodeMap.containsKey(head.random)){
				newHead.random = nodeMap.get(head.random);
			}
			else{
				Node ramdomNode = new Node(head.random.val);
				newHead.random = ramdomNode;
				nodeMap.put(head.random,ramdomNode);
			}
		}
		Node p = head.next;
		Node pre = newHead;
		while(p!=null){
			Node pClone = null;
			if(nodeMap.containsKey(p)){
				pClone = nodeMap.get(p);
				pre.next = pClone;
				pre = pClone;
			}
			else{
				pClone = new Node(p.val);
				pre.next =pClone;
				pre = pClone;
				nodeMap.put(p,pClone);

			}
			if(p.random!=null){
				if(nodeMap.containsKey(p.random)){
					pClone.random = nodeMap.get(p.random);
				}
				else{
					Node newRandom = new Node(p.random.val);
					pClone.random = newRandom;
					nodeMap.put(p.random,newRandom);
				}
			}
			p = p.next;
		}
		return newHead;
	}
}
