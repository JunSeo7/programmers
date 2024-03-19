package kh.model.vo;

import java.util.Scanner;

public class Main29 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int n = 7;
		int t = 15;
		int answer = 0;
		
		for(int i = 0; i < t; i++ ) {
			n *= 2;
		}
		answer = n;
		System.out.println(answer);
		

	}

}
