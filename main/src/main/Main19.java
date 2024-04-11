package main;

public class Main19 {
	public int solution(int num) {
		int answer = 0;

		while (num != 1 && answer <= 500) {
			if (num % 2 == 0) {
				num = num / 2;
			} else if (num % 2 == 1) {
				num = (num * 3) + 1;
			}
			answer++;
		}
		if (answer >= 500) {
			answer = -1;
		}
		System.out.println(answer);

		return answer;
	}

	public static void main(String[] args) {
		Main19 m = new Main19();
		m.solution(626331);
	}
}
