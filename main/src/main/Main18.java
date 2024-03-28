package main;

public class Main18 {

	public boolean solution(String s) {

		boolean answer = true;

		if (s.length() == 4 || s.length() == 6) {
			for (int i = 0; i < s.length(); i++) {
				if (s.charAt(i) < 48 || s.charAt(i) > 57) {
					return false;
				}
			}
		} else {
			return false;
		}
		return answer;
	}

	public static void main(String[] args) {
		Main18 m = new Main18();
		m.solution("a234");

	}
}
