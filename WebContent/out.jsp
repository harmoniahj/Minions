<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>
<%
String id =(String)session.getAttribute("id");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "delete from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate(); // sql 실행
}catch(Exception e){
	
}finally{
	if(pstmt != null)
		try{pstmt.close();}catch(SQLException sqle){}
	
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>
<script type="text/javascript">
	   alert("탈퇴 되었습니다.");
	   location.href="index.jsp?";
</script>
</body>
</html>