package main;

import java.util.Scanner;

public class PgsLv002 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String ineq = sc.nextLine();
		String eq = sc.nextLine();
		int n = sc.nextInt();
		int m = sc.nextInt();
		int answer;

		if (ineq.equals(">") && eq.equals("=")) {
			answer = n >= m ? 1 : 0;
		} else if (ineq.equals("<") && eq.equals("=")) {
			answer = n <= m ? 1 : 0;
		} else if (ineq.equals(">") && eq.equals("!")) {
			answer = n > m ? 1 : 0;
		} else {
			answer = n < m ? 1 : 0;
		}
		System.out.println(answer);
	}

}
