package pgs;

import java.util.Arrays;
import java.util.Collections;

public class Main12 {
	public static void main(String[] args) {

		long n = 118372;
		long answer = 0;
		String answer1 = "";
		String x = Long.toString(n);
		Integer[] z = new Integer[x.length()];

		for (int i = 0; i < x.length(); i++) {
			char b = x.charAt(i);
			z[i] = Character.getNumericValue(b);
		}
		Arrays.sort(z, Collections.reverseOrder());

		for (int j = 0; j < x.length(); j++) {
			Integer r = z[j];
			String e = String.valueOf(r);
			answer1 += e;
		}
		answer = Long.parseLong(answer1);
		System.out.println(answer);
	}
}
