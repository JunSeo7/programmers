package main;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main17 {

	// 좋은 풀이
	public int[] solution(int[] arr, int divisor) {
		Arrays.sort(arr);
		List<Integer> lst1 = new ArrayList<Integer>();

		for (int item : arr) {
			if (item % divisor == 0) {
				lst1.add(item);
			}
		}

		int lstSize = lst1.size();
		if (lstSize == 0) {
			int[] answer = { -1 };
			return answer;
		}

		int[] answer = new int[lstSize];
		for (int i = 0; i < lstSize; ++i) {
			answer[i] = lst1.get(i);
		}
		System.out.println(Arrays.toString(answer));
		return answer;
	}

	// 내 풀이
	public ArrayList<Integer> solution1(int[] arr, int divisor) {

		ArrayList<Integer> b = new ArrayList<Integer>();

		for (int i = 0; i < arr.length; i++) {
			if (arr[i] % divisor == 0) {
				b.add(arr[i]);
			}

		}
		if (b.size() == 0) {
			b.add(-1);
		}
		b.sort(null);
		System.out.println(b);

		return b;
	}

	// 코드 테스트
	public static void main(String[] args) {
		Main17 m = new Main17();
		int[] arr = { 2, 36, 1, 3 };
		m.solution(arr, 1);
	}

}
