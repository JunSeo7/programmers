package main;

import java.util.Arrays;

public class Main17 {

	public int[] solution(int[] arr, int divisor) {
		int cnt = 0;
		int[] answer = new int[arr.length];
		
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] % divisor == 0) {
				answer[cnt] = arr[i];
				cnt++;
			} 
		}
		System.out.println(Arrays.toString(answer));
		
		return answer;
	}

	public static void main(String[] args) {
		Main17 m = new Main17();
		int[] arr = { 5, 9, 7, 10 };
		m.solution(arr, 5);
	}

}
