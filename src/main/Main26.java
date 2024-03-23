package pgs;

import java.util.Arrays;

public class Main26 {

	public static void main(String[] args) {

		String[] strlist = {"We", "are", "the", "world!"};
		int[] answer = new int[strlist.length];
		
		for(int i = 0; i < strlist.length; i++) {
			String x =  strlist[i];
			answer[i] = x.length();
		}
		
		System.out.println(Arrays.toString(answer));
	}

}
