package pgs1;

import java.util.Arrays;
import java.util.Collections;

public class Main13 {
	public static void main(String[] args) {
		String answer = "";
		String s = "Zbcdefg";
		String[] q = new String[s.length()];

		for (int i = 0; i < s.length(); i++) {
			char b = s.charAt(i);
			String j = String.valueOf(b);
			q[i] = j;
		}
		Arrays.sort(q, Collections.reverseOrder());

		for (int i = 0; i < q.length; i++) {
			answer += q[i];
		}
		answer = String.valueOf(answer);
		System.out.println(answer);
	}

}
