package kh.model.vo;

import java.util.Scanner;

public class Main14 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int angle = sc.nextInt();

		int answer;

		// 다중 삼항 연산자 연습(?) 
		answer = angle > 0 && angle < 90 ? 1 : angle > 90 && angle < 180 ? 3 : angle == 180 ? 4 : angle == 90 ? 2 : 0;
		System.out.println(answer);

	}

}
