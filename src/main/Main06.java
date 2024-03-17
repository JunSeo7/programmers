package main;

import java.util.Scanner;

public class Main06 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int answer = 0;
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		
		answer = num1 == num2 ? 1 : -1;
		System.out.println(answer);
		
	}

}
