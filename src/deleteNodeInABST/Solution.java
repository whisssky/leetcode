package deleteNodeInABST;

//https://leetcode-cn.com/problems/delete-node-in-a-bst/

import commonModel.TreeNode;

public class Solution {

	public TreeNode deleteNode(TreeNode root, int key) {

		if(root==null){
			return null;
		}
		if(root.val < key){
			root.right = deleteNode(root.right,key);
		}
		else if(root.val > key){
			root.left = deleteNode(root.left,key);
		}
		else{

			if(root.left==null && root.right==null){
				return null;
			}
			else if(root.left==null && root.right!=null){
				return root.right;
			}
			else if(root.left!=null && root.right==null){
				return root.left;
			}
			else{
				TreeNode n = root.right;
				while(n.left!=null){
					n = n.left;
				}
				n.left = root.left;
				return root.right;
			}
		}
		return root;
	}
}
