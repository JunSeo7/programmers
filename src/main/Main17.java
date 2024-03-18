package kh.model.vo;

import java.util.Scanner;

public class Main17 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int[] array = { 0, 2, 3, 4 };
		int n = 1;

		int answer = 0;

		for (int i = 0; i < array.length; i++) {
			if (array[i] == n) {
				answer++;
			}
		}
		System.out.println(answer);
	}

}
