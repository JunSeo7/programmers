package kh.model.vo;

import java.util.Scanner;

public class Main16 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int[] numbers = {89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99};
		double answer = 0;
		double answer1 = 0;
		
		for(int i = 0; i < numbers.length; i++) {
			answer += numbers[i];
			answer1 = answer / (double)numbers.length;
		}
		System.out.println(answer1);

	}

}
