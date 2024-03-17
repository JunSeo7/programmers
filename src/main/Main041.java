package main;

import java.util.Arrays;

public class Main041 {

	public static void main(String[] args) {
		
		int[] num_list = new int[5];

		num_list[0] = 5;
		num_list[1] = 2;
		num_list[2] = 1;
		num_list[3] = 7;
		num_list[4] = 5;

		int[] answer = new int[num_list.length + 1];
		
		for(int i = 0; i < num_list.length; i ++) {
			answer[i] = num_list[i];
		}
		for (int i = num_list.length - 1; i > num_list.length - 2; i--) {
			if (num_list[i] > num_list[i - 1]) {
				answer[i + 1] = num_list[i] - num_list[i - 1];
			} else {
				answer[i + 1] = num_list[i] * 2;
			}
		}
		System.out.println(Arrays.toString(answer));
	}
}
