package kh.model.vo;

import java.util.Scanner;

public class Main13 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		double num1 = sc.nextInt();
		double num2 = sc.nextInt();

		double answer = num1 / num2 * 1000;
		System.out.println((int)answer);
		

	}

}
