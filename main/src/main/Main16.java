package kh;

public class Main16 {

	// 내 풀이
	public int solution(int[] absolutes, boolean[] signs) {
		int answer = 0;

		for (int i = 0; i < absolutes.length; i++) {
			if (signs[i] == false) {
				absolutes[i] = -absolutes[i];
			}
			answer += absolutes[i];
		}
		System.out.println(answer);
		return answer;
	}

	// 좋은 풀이
	public int solution1(int[] absolutes, boolean[] signs) {
		int answer = 0;

		for (int i = 0; i < absolutes.length; i++) {
			answer += absolutes[i] * (signs[i] ? 1 : -1);
		}
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {

		Main16 m = new Main16();
		int[] absolutes = { 4, 7, 12 };
		boolean[] signs = { true, false, true };
		m.solution(absolutes, signs);
	}

}
