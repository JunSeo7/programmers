package kh.model.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Main23 {

    public static void main(String[] args) {

        int[] answer = {};

        Scanner sc = new Scanner(System.in);
        int l = sc.nextInt();
        int r = sc.nextInt();
        ArrayList<String> y = new ArrayList<>();

        for (int i = l; i <= r; i++) {
            String x = Integer.toString(i);
            if (x.contains("5")) {
                boolean isV = true;
                for (int j = 0; j < x.length(); j++) {
                    char c = x.charAt(j);
                    if (c != '5' && c != '0') {
                        isV = false;
                        break;
                    }
                }
                if (isV) {
                    y.add(x);
                }
            }
        }
        if (y.isEmpty()) {
            answer = new int[]{-1};
        } else {
            answer = new int[y.size()];
            for (int i = 0; i < y.size(); i++) {
                answer[i] = Integer.parseInt(y.get(i));
            }
        }
        System.out.println(Arrays.toString(answer));
    }
}
