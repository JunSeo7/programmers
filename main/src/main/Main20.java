package main;

public class Main20 {

	public String solution(String[] seoul) {
		String answer = "";

		for (int i = 0; i < seoul.length; i++) {
			if (seoul[i].equals("Kim")) {
				answer = "김서방은 " + i + "에 있다";
			}
		}
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {
		Main20 m = new Main20();
		String[] seoul = { "Jane", "Kim" };
		m.solution(seoul);
	}

}
