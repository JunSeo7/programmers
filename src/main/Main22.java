package pgs;

public class Main22 {

	public static void main(String[] args) {
		int answer = 0;
		int[] dot = { -1, 1 };

		if (dot[0] > 0 && dot[1] > 0) {
			answer = 1;
		} else if (dot[0] < 0 && dot[1] > 0) {
			answer = 2;
		} else if (dot[0] < 0 && dot[1] < 0) {
			answer = 3;
		} else {
			answer = 4;
		}

		System.out.println(answer);

	}

}
