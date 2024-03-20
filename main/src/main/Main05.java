package main;

public class Main05 {

	public static void main(String[] args) {
		double answer = 0;
		int x = 0;
		int[] arr = {5,5};
		for (int i = 0; i < arr.length; i++) {
			x += arr[i];
			answer = (double) x / arr.length;
		}
		System.out.println(answer);
	}

}
