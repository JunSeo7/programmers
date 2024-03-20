package main;

import java.util.Scanner;

public class Main10 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		long answer = 0;

		int a = sc.nextInt();
		int b = sc.nextInt();
		for (int i = a; i <= b; i++) {
			answer += i;
		}
		if (a > b) {
			for (int i = b; i <= a; i++) {
				answer += i;
			}
		}
		System.out.println(answer);

	}

}
