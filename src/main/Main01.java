package main;

public class Main01 {

	public static void main(String[] args) {

		int[] num_list = new int[5];

		String add = "";
		String odd = "";

		int ansewr;
		num_list[0] = 3;
		num_list[1] = 4;
		num_list[2] = 5;
		num_list[3] = 2;
		num_list[4] = 1;

		for (int i = 0; i < num_list.length; i++) {
			if (num_list[i] % 2 == 0) {
				add += Integer.toString(num_list[i]);
			} else if (num_list[i] % 2 == 1 || num_list[i] == 1) {
				odd += Integer.toString(num_list[i]);
			}
		}
		
		int adds = Integer.parseInt(add);
		int odds = Integer.parseInt(odd);
		
		System.out.println(adds + odds);
		
	}

}
