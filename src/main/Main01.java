package main;

import java.util.Arrays;
import java.util.Scanner;

public class Main01 {

	// 프로그래머스 LV1 - 12954
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int x = sc.nextInt();
		int n = sc.nextInt();

		long[] answer = new long[n];

		for (int i = 0; i < answer.length; i++) {
			answer[i] = (long) x * (1 + i);
		}
		System.out.println(Arrays.toString(answer));

	}

}