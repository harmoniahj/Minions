<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
</head>
<body>
<%
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 String name = request.getParameter("name");
 Timestamp register = new Timestamp(System.currentTimeMillis());
 String adress = request.getParameter("adress");
 String tel = request.getParameter("tel");

%>
<%
 Connection conn = null;
 PreparedStatement pstmt = null; // query를 실행시키기위해 준비하는 객체
 String str = "";
 try{
		String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02"; // URL주소 저장
		String dbId="jspid2"; // ID 저장
		String dbPass="jsp2018"; // PassWord 저장
		
		Class.forName("com.mysql.jdbc.Driver"); // JDBC Driver로딩
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// ↖ 위에  Driver를 가지고  Connection객체에 로딩
		out.println("데이터베이스 연결에 성공하였습니다.");
		
		String sql = "insert into member values(?,?,?,?,?,?)"; //받은 값 할당
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		pstmt.setString(5, adress);
		pstmt.setString(6, tel);
		pstmt.executeUpdate(); // sql 실행
		%>
		
		<script type="text/javascript">
		   alert("회원가입이 되었습니다.");
		   location.href="index.jsp?target=login_form";
		   </script>
<%		
	}catch(Exception e){
		e.printStackTrace();
		out.println("member 테이블에 새로운 레코드 추가를 실패하였습니다.");
	}finally{
		if(pstmt != null)
			try{pstmt.close();} catch(SQLException sqle){}
		if(conn != null)
			try{pstmt.close();} catch(SQLException sqle){}
	}
%>
</body>
</html>