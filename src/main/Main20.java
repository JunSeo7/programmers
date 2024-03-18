package kh.model.vo;

import java.util.Scanner;

public class Main20 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int height = sc.nextInt();
		int[] array = { 149, 180, 192, 170 };
		int answer = 0;

		for (int i = 0; i < array.length; i++) {
			if (array[i] > height) {
				answer++;
			}
		}
		System.out.println(answer);

	}

}
