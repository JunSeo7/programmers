package main;

public class Main03 {

	public static void main(String[] args) {
		int n = 12;
		int answer = n;
		int[] arr = new int[n];

		for (int i = 1; i < n; i++) {
			if (n % i == 1) {
				if (answer > i) {
					answer = i;
				}
			}
		}
		System.out.println(answer);

	}

}