package pgs1;

public class Main15 {

	// 다른 사람 좋은 풀이
	public String solution(String phone_number) {
		char[] ch = phone_number.toCharArray();
		for (int i = 0; i < ch.length - 4; i++) {
			ch[i] = '*';
		}
		System.out.println(ch);
		return String.valueOf(ch);
	}

	// 내 풀이
	public String solution1(String phone_number) {
		String answer = "";
		phone_number.split("");

		String[] v = new String[phone_number.length()];
		v = phone_number.split("");

		for (int i = 0; i < phone_number.length(); i++) {
			if (i < phone_number.length() - 4) {
				v[i] = "*";
			}
			answer += v[i];
		}
		System.out.println(answer);

		return answer;
	}

	public static void main(String[] args) {

		Main15 m = new Main15();
		m.solution("01033334444");
		m.solution1("01033334444");

	}

}
