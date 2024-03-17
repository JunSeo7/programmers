package main;

import java.util.Scanner;

public class Main05 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int n = 0;
		String control = "wsdawsdassw";
		int answer = 0;

		for (String s : control.split("")) {
			if (s.equals("w")) {
				n += 1;
			}
			if (s.equals("s")) {
				n -= 1;
			}
			if (s.equals("d")) {
				n += 10;
			}
			if (s.equals("a")) {
				n -= 10;
			}
		}
		answer = n;
		System.out.println(answer);

	}

}
