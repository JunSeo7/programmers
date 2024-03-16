package main;

import java.util.Scanner;

public class PgsLv001 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		int b = sc.nextInt();
		int answer;

		boolean flag = false;

		answer = flag == true ? a + b : a - b;
		
		System.out.println(answer);
	}

}
