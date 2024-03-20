package main;

public class Main02 {
	
	// 프로그래머스 LV1 - 132267
	public static void main(String[] args) {
		int a = 2;
		int b = 1;
		int n = 20;
		int answer = 00;
		;
		while (n >= a) {
			answer += (n / a) * b;
			n = (n / a) * b + (n % a);
		}
		System.out.println(answer);
		
	}

}