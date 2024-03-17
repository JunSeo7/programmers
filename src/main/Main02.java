package main;

import java.util.Scanner;

public class Pgs181930 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		int b = sc.nextInt();
		int c = sc.nextInt();

		int answer = 0;
		int answer1 = a + b + c;
		int answer3 = a * a * a + b * b * b + c * c * c;
		int answer2 = a * a + b * b + c * c;

		if (a == b && b == c && a == c) {
			answer = answer1 * answer2 * answer3;
		} else if (a != b && a != c && b != c) {
			answer = answer1;
		} else {
			answer = answer1 * answer2;
		}
		System.out.println(answer);
	}
}
