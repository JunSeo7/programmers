package kh.model.vo;

import java.util.Scanner;

public class Main21 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int n = 64;
		int k = 6;

		int answer = 0;
		if (n >= 10) {
			answer = n * 12000 + (k - n / 10) * 2000;
		} else {
			answer = n * 12000 + k * 2000;
		}
		System.out.println(answer);

	}

}
