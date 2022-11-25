<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect" %>
<%
	JDBConnect jdbc = new JDBConnect(); // JDBConnect 타입의 객체 생성
	out.print("<h1>DB연결 성공</h1>");
	jdbc.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>