package zigZagConversion;

/**
 * 第六题 ZigZag Conversion
 * 
 * @author whisssky
 *
 */
public class Solution {

	public String convert(String s, int numRows) {
		if(s=="" || numRows==1 ||s.length()==1)
			return s;
		char []a = s.toCharArray();
		StringBuilder []line = new StringBuilder[numRows];
		for(int f=0;f<line.length;f++)
		{
			line[f] = new StringBuilder();
		}
		StringBuilder str= new StringBuilder();
		int i=0;
		while(i<a.length)
		{
			int j;
			for(j=0;j<numRows && i<a.length;j++)
			{
				line[j].append(a[i]);
				i++;
			}
			for(j=numRows-2;j>0 && i<a.length;j--)
			{
				line[j].append(a[i]);
				i++;
			}
		}
		for(int k=0;k<numRows;k++)
		{
			
			str.append(line[k]);
		}
		
		return str.toString();
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Solution a = new Solution();
		System.out.println(a.convert("PAYPALISHIRING", 3));;

	}

}
