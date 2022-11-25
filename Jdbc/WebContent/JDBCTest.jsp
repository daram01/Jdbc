<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // db주소를 변수 url에 담았음.
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 이것이 없으면 오라클 데이터베이스를 사용할 수 없음.
		conn = DriverManager.getConnection(url, "musthave", "1234"); // 연결 DriverManager.getConnection(DB주소, "아이디", "비밀번호");
		
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	DB연결 성공
</body>
</html>