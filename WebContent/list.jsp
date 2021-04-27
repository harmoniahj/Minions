<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %><% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
 .r { 
 background : #4F81BD;
 color : #FFFFFF; }

 .button {
  background:#4F81BD;
  border:0;	color:#fff;
  font-size:20px;	width:230px;
  margin:20px auto auto auto;	padding:10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}
</style>
</head>
<body>
<center>
<table border="1">
<form action="index2.jsp?target=write" method="post">

<tr class="r">
	<td>글번호</td>
	<td>작성자</td>
	<td>글제목</td>
	<td>글내용</td>
	<td>글쓴시간</td>
</tr>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;


try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql ="select * from board order by bid desc";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String uid = rs.getString("uid");
		int bid = rs.getInt("bid");
		String subject=rs.getString("subject");
		String comment=rs.getString("comment");
		Timestamp register =rs.getTimestamp("reg_data");
		
		%>
		<tr class="Label">
		<td><%= bid %></td>
		<td><%= uid %></td>
		<td style="width:100px"><%= subject%></a></td>
		<td style="width:200px"><a href="index2.jsp?target=detail&bid=<%=bid%>"><%= comment%></a></td>
		<td><%= register%></td>
		
		</tr>
	<%}
	
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
</table>
<input type="submit" class="button" value="글쓰기" >
</form>
</center>
</body>
</html>