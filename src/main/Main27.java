package pgs;

import java.util.Arrays;

public class Main27 {

	public int[] solution(int[] num_list) {
		int[] answer = new int[2];

		for (int i = 0; i < num_list.length; i++) {
			if (num_list[i] % 2 == 0) {
				answer[0]++;
			} else {
				answer[1]++;
			}

		}

		System.out.println(Arrays.toString(answer));
		return answer;
	}

	public static void main(String[] args) {
		Main27 m = new Main27();
		int[] num_list = { 1, 3, 5, 7 };
		m.solution(num_list);
	}

}
