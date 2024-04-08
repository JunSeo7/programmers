package pgs;

public class Main34 {

	public int solution(int i, int j, int k) {
		int count = 0;

		for (int num = i; num <= j; num++) {
			String numString = String.valueOf(num);
			for (int j = 0; j < numString.length(); j++) {
				if (numString.charAt(j) - '0' == k) {
					count++;
				}
			}
		}
		System.out.println(count);
		return count;
	}

	public static void main(String[] args) {
		Main34 m = new Main34();
		m.solution(1, 13, 1);
	}
}