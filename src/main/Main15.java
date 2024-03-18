package kh.model.vo;

import java.util.Scanner;

public class Main15 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		
		int answer = 0;
		for(int i = 2; i <= n; i++) {
			if(i % 2 == 0) {
				answer += i;
			}
		}

	}

}
