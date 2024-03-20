package main;

import java.util.Scanner;

public class Main06 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		System.out.println("정수 입력");
		int num = sc.nextInt();

		String answer = "";

		answer = num % 2 == 0 ? "Even" : "Odd";
		System.out.println(answer);
	}

}
