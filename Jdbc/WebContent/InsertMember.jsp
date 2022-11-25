<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect(); // db 연결
		
		String sql = "insert into member values(?,?,?,sysdate)"; // ? ? ? 은 아직 정해지지 않은 데이터. 동적 쿼리문이라고 한다.
		// SQL에서 하던대로 코드를 작성해주면 된다. (데이터 생성 -> insert into 테이블명 values 값)
		PreparedStatement psmt = jdbc.con.prepareStatement(sql); // prepareStatement를 생성하는 것임.
		psmt.setString(1, "test1"); // setString()-> 컬럼명이 문자열일 경우에 쓰는 메소드
		psmt.setString(2, "1111");
		psmt.setString(3, "회원1");
		
		int result = psmt.executeUpdate(); // 쿼리문 실행
		// 반환타입이 int인데, 정상적이면 0 이상의 수가 나오기 때문.
		if(result != 0){ // 그래서 정상적으로 됐는지 확인하기 위해 if문을 추가할 수있다.
			out.print("쿼리문 실행 성공");
		}else {
			out.print("쿼리문 실행 실패");
		}
		out.print("쿼리문 실행 완료");
		
		psmt.close();
		jdbc.close();
	%> --%>
	
	<h2>회원 조회 테스트(executeQuery() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect(); // db 연결
		
		String sql = "select * from member"; // 정적 쿼리문
		Statement stmt = jdbc.con.createStatement();
		ResultSet rs = stmt.executeQuery(sql); // 조회된 결과를 변수 rs에 넘겨주는 것.
		// 반환타입이 ResultSet. 조회하고 나면 프로그램에서 직접적으로 데이터를 쓸 수 없는데, 이 객체를 사용해서 조회된 결과를 자바에서 쓸 수 있도록 한다.
		
		// rs.next(); 제일 첫번째 레코드 정보를 읽어온다. 한번 실행할 때 마다 그 다음 레코드로 넘어간다.
		// 데이터가 있으면 true, 데이터가 없으면 false를 반환하는 메소드이다. 타입이 boolean 임.
		
		while(rs.next()){
			String id = rs.getString("id"); // getString("실제 sql 테이블에 있는 컬럼명");
			String pw = rs.getString("pass");
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br />");
		}
		

		jdbc.close();
		
		// PreparedStatement, Statement, ResultSet, Connection -> 사용하고 나면 꼭 close()해줘야 하는 것들
	%>
</body>
</html>