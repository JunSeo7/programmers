package pgs1;

public class Main14 {

	public boolean solution(int x) {
		boolean answer = true;

		int y = 0;
		String b = String.valueOf(x);
		int[] z = new int[b.length()];
		for (int i = 0; i < b.length(); i++) {
			char c = b.charAt(i);
			z[i] = Character.getNumericValue(c);
		}
		for (int i = 0; i < z.length; i++) {
			y += z[i];
			if (x % y == 0) {
				answer = true;
			} else {
				answer = false;
			}
		}
		System.out.println(answer);

		return answer;
	}

	public static void main(String[] args) {
		Main14 s = new Main14();
		s.solution(10);

	}
}