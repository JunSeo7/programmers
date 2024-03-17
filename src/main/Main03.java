package main;

public class Main03 {

	public static void main(String[] args) {
		int[] num = new int[4];
		num[0] = 5;
		num[1] = 7;
		num[2] = 8;
		num[3] = 3;

		int answer = 0;

		int odd = 0;
		int x = 1;

		for (int i = 0; i < num.length; i++) {
			odd += num[i];
			x *= num[i];
		}
		odd = odd * odd;

		if (x < odd) {
			answer = 1;
		} else {
			answer = 0;
		}
		System.out.println(answer);

	}

}
