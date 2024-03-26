package main;

public class Main32 {

	public String solution(String myString) {
		String answer = "";

		answer = myString.toUpperCase();
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {
		Main32 m = new Main32();
		m.solution("aBcDeFg");

	}

}
