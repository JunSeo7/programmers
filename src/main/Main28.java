package pgs;

import java.util.Arrays;

public class Main28 {

	public int[] solution(int money) {
		int[] answer = new int[2];

		
		answer[0] = money / 5500;
		answer[1] = money % 5500;

		System.out.println(Arrays.toString(answer));

		return answer;
	}

	public static void main(String[] args) {
		Main28 m = new Main28();
		m.solution(15000);
	}
}
