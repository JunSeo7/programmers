package kh.model.vo;

import java.util.Arrays;
import java.util.Scanner;

public class Main24 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		long n = 12345;
		String a = String.valueOf(n);

		int[] answer = new int[a.length()];
		int[] answer1 = new int[a.length()];
		int cnt = 0;

		for (int i = 0; i < a.length(); i++) {
			char b = a.charAt(i);
			answer1[i] = Character.getNumericValue(b);
		}
		for(int i = a.length()-1; i >= 0; i--) {
			answer[cnt++] = answer1[i];
		}
		System.out.println(Arrays.toString(answer));
	}

}
