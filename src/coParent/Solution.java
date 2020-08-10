package coParent;


import java.util.ArrayList;
import java.util.List;

/*
     https://leetcode-cn.com/problems/er-cha-shu-de-zui-jin-gong-gong-zu-xian-lcof/
 */
public class Solution {

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {

        if(root==p){
            return p;
        }
        if(root==q){
            return q;
        }
        List<TreeNode> first = new ArrayList<>();
        List<TreeNode> mid = new ArrayList<>();

        fisrt(root,first);
        mid(root,mid);
        int index1=-1;
        int index2=-1;
        for(int j=0;j<first.size();j++){
            if(first.get(j) == p || first.get(j) == q ){
                if(index1==-1){
                    index1 = j;
                }
                else
                {
                    index2 = j;
                }
            }

        }
        for(int i=0;i<=mid.size();i++){
            TreeNode s = mid.get(i);
            for(int j=index1;j<=index2;j++){
                if(s==first.get(j)){
                    return s;
                }
            }
        }
        return root;
    }
    public void fisrt(TreeNode n,List<TreeNode> list){

        if(n==null){
            return;
        }
        fisrt(n.left,list);
        list.add(n);
        fisrt(n.right,list);
    }

    public void mid(TreeNode n,List<TreeNode> list){

        if(n==null){
            return;
        }
        list.add(n);
        mid(n.left,list);
        mid(n.right,list);
    }

}
