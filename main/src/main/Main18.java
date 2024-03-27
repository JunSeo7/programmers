package main;

import java.util.Scanner;

public class Main18 {

	public static final Scanner SC = new Scanner(System.in);

	public boolean solution(String s) {
		boolean answer = true;
		if (s.length() != 4 || s.length() != 6) {
			answer = false;
			System.out.println(answer);
			return false;
		}
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) < '0' || s.charAt(i) > '9') {
				System.out.println(s.charAt(i));
				answer = false;
				System.out.println(answer);
				return false;
			} 
		}
		return answer;
	}

	public static void main(String[] args) {
		Main18 m = new Main18();
		m.solution("1234");

//		PracticeController pc = new PracticeController();
//		try {
//			pc.printMenu();
//		} catch (Exception e) {
//			System.out.println("오류 발생");
//			e.printStackTrace();
//		}

	}
}
