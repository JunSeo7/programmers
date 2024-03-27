package main;

import java.util.Arrays;

public class Main01 {

	public int solution(int[] A, int[] B) {
		int answer = 0;

		Arrays.sort(A);
		Arrays.sort(B);
		for (int i = 0; i < A.length; i++) {
			answer += A[i] * B[B.length - 1 - i];
		}

		System.out.println(answer);

		return answer;
	}

	// 코드 테스트
	public static void main(String[] args) {

		int[] A = { 1, 2 };
		int[] B = { 3, 4 };

		Main01 m = new Main01();
		m.solution(A, B);
	}

}
