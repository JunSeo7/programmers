package pgs;

import java.util.Arrays;

public class Main25 {

	public static void main(String[] args) {

		int[] array = {1, 2, 3, 4, 5};
		int answer = 0;
		
		Arrays.sort(array);
		
		answer = array[array.length/2];
		
		System.out.println(answer);

	}

}
