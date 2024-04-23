package pgs;

import java.util.Arrays;

public class Main35 {
	public int[] solution(int n) {
		int[] answer = new int[(n + 1) / 2];

		for (int i = 1; i <= n; i++) {
			if (i % 2 == 1) {
				answer[i / 2] = i;
			}
		}
		System.out.println(Arrays.toString(answer));

		return answer;
	}

	public static void main(String[] args) {
		Main35 m = new Main35();
		m.solution(15);
	}

}
