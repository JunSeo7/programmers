package kh.model.vo;

import java.util.Arrays;
import java.util.Scanner;

public class Main19 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int[] num_list = { 1, 2, 3, 4, 5 };
		int[] answer = new int[num_list.length];

		for (int i = 0; i < num_list.length; i++) {
			answer[i] = num_list[num_list.length -1 - i];
		}
		System.out.println(Arrays.toString(answer));

	}

}
