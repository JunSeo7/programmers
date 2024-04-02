package kh;

import java.util.Arrays;

public class Main33 {

	public int solution(int[] sides) {
		int answer = 0;
		
		Arrays.sort(sides);
		
		answer = sides[0] + sides[1] > sides[2] ? 1 : 2;
		System.out.println(answer);

		return answer;
	}

	public static void main(String[] args) {

		int[] sides = { 199, 72, 222 };
		Main33 m = new Main33();
		m.solution(sides);
	}

}
