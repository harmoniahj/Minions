<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %><% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<body>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String bid = (String)request.getParameter("bid");
String rcomment = (String)request.getParameter("comment");
String comment = rcomment.replaceAll("\n", "<br>");
int num = Integer.parseInt(bid);
try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select * from board where bid=?";
    pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,num);	
    rs = pstmt.executeQuery();
    
	while(rs.next()){
		 sql = "update board set comment=? where bid=?";
	     pstmt=conn.prepareStatement(sql);
	     pstmt.setString(1, comment);
	     pstmt.setString(2, bid);

	     pstmt.executeUpdate();
		}
	
	}catch(Exception e){
		
	}finally{
		if(rs !=null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null)
			try{conn.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
		
	}
		%>
    <script type="text/javascript">
     alert("게시글이 수정되었습니다.");
     location.href="index2.jsp?target=list";
     </script>
</body>
</html>