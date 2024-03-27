package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws Exception {

		Scanner sc = new Scanner(System.in);

		System.out.println("-----JDBC-----");

		// JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 데이터베이스 연결 정보 준비
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // java = oracle 연결준비
		String id = "C##KH";
		String pwd = "1234";

		// 데이버베이스 연결 == 커넥션 객체 얻기
		Connection conn = DriverManager.getConnection(url, id, pwd);

		String a = sc.nextLine();
		String b = sc.nextLine();
		String c = sc.nextLine();

		// SQL준비
		String sql = "INSERT INTO MEMBER(ID,PWD,NICK) VALUES('" + a + "','" + b + "','" + c + "')";
//		String sql = "UPDATE MEMBER SET PWD = '0000'";
//		String sql = "DELETE MEMBER";

		// SQl실행을 위한 statement 준비
		Statement stmt = conn.createStatement();

		// statement 에 SQL 담아주고 실맹 및 결과 리턴받기
		int result = stmt.executeUpdate(sql);
//		conn.commit(); - auto commit 이 자동으로 실행 됨

		// 결과 출력
		System.out.println("쿼리문 실행 결과 : " + result);

		// 사용후 자원반납
		// ~~~
	}

}
