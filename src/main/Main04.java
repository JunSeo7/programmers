package main;

import java.util.ArrayList;
import java.util.List;

public class Main04 {

	public static void main(String[] args) {
		
		// ArrayList 사용
		int[] num_list = new int[5];

		num_list[0] = 5;
		num_list[1] = 2;
		num_list[2] = 1;
		num_list[3] = 7;
		num_list[4] = 5;

		List answer = new ArrayList();

		for (int i = 0; i < num_list.length; i++) {
			answer.add(num_list[i]);
		}

		for (int i = num_list.length - 1; i > num_list.length - 2; i--) {
			if (num_list[i] > num_list[i - 1]) {
				answer.add(num_list[i] - num_list[i - 1]);

			} else {
				answer.add(num_list[i] * 2);
			}
		}
		System.out.println(answer.toString());
	}
}
