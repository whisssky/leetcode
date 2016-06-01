package test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Jicheng {
	public static void main(String[] args){
		InputStream in = null;
		try {
			for(int i=0;i<2;i++){
			String []cmd = {"/bin/sh","-c","cd run&&/usr/local/bin/runghc classcast.hs"};
			Process pro =Runtime.getRuntime().exec(cmd);
			in = pro.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in));
			String result;
			while((result = read.readLine()) != null){
				System.out.println("INFO:"+result);
				
			}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}