package pgs;

import java.util.Arrays;

public class Main30 {

	public int solution(int[] numbers) {
		int answer = 0;

		Arrays.sort(numbers);
		answer = numbers[numbers.length - 1] * numbers[numbers.length - 2];
		System.out.println(answer);

		return answer;
	}

	public static void main(String[] args) {
		Main30 m = new Main30();
		int[] numbers = { 0, 31, 24, 10, 1, 9 };
		m.solution(numbers);
	}

}
