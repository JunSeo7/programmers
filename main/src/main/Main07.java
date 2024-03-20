package main;

import java.util.Scanner;

public class Main07 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int answer = 0;
		int n = sc.nextInt();

		String a = Integer.toString(n);
		for (int i = 0; i < a.length(); i++) {
			char x = a.charAt(i);
			Character.toString(x);
			answer += Integer.parseInt(Character.toString(x));
		}
		System.out.println(answer);
	}

}
