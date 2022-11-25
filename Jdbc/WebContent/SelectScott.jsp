<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect2" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Scott계정의 emp01 테이블 조회하기</h2>
	<%
		JDBConnect2 jdbc = new JDBConnect2(); // DB에 연결
		// deptno 30번 부서를 다 10번으로 업데이트 하기
		String updatesql = "update emp01 set deptno = ? where deptno = ?";
		PreparedStatement psmt2 = jdbc.con.prepareStatement(updatesql);
		psmt2.setInt(1, 10);
		psmt2.setInt(2, 30);
		
		psmt2.executeUpdate();
		// deptno 30번 부서를 다 10번으로 업데이트 하기
		
		// 부서번호가 10번인 사람을 모두 지우기
		String deletesql = "delete from emp01 where deptno = ?";
		PreparedStatement psmt3 = jdbc.con.prepareStatement(deletesql);
		psmt3.setInt(1, 10); 
		psmt3.executeUpdate();
		// 부서번호가 10번인 사람을 모두 지우기
		
		
		String sql = "select * from emp01";
		PreparedStatement ptmt1 = jdbc.con.prepareStatement(sql);
		ResultSet rs = ptmt1.executeQuery();
		
		while(rs.next()){
			int empno = rs.getInt("EMPNO");
			String ename = rs.getString("ENAME");
			String job = rs.getString("JOB");
			int mgr = rs.getInt("MGR");
			java.sql.Date hiredate = rs.getDate("HIREDATE");
			int sal = rs.getInt("SAL");
			int comm = rs.getInt("COMM");
			int deptno = rs.getInt("DEPTNO");

			out.println(String.format("%d %s %s %d %s %d %d %d", empno, ename, job, mgr, hiredate, sal, comm, deptno) + "<br />");
		}
		
		jdbc.close();
	%>
</body>
</html>