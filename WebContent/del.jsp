<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %><% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
</head>
<body>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql = "";
String bid = request.getParameter("bid");
	
try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
	sql = "DELETE FROM board WHERE bid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,bid);
		
	pstmt.executeUpdate();
%>
 <script type="text/javascript">
 alert("삭제완료");
 location.href="index2.jsp?target=list";
 </script>
<%
	
	}catch(Exception e){
		e.printStackTrace();
		%>
	     <script type="text/javascript">
	     alert("삭제실패");
	     location.href="index2.jsp?target=list";
	     </script>
	     <%
	}finally{
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
	}
%>
</body>
</html>