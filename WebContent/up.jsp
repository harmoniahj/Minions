<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<body>
<center>
<%
 Connection conn=null;
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 String bid = (String)request.getParameter("bid");
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

      if(rs.next()){
    	int borderid = rs.getInt("bid");
        String uid = rs.getString("uid");
        String subject = rs.getString("subject");
        String comment = rs.getString("comment");
        String date = rs.getString("reg_data");

  %>
<form action="update.jsp" method="post" >
<input type="hidden" name ="bid" value=<%=bid %>>
<table border="1">
 <tr>
  <th>글제목</th>
  <td><input type="text" id="subject" name="subject" value="<%=subject%>"></td>
 </tr>
 <tr>
  <th style="height:400px;">글내용</th>
  <td><textarea style= width:500px;height:300px; id="comment" name="comment" ><%=comment%></textarea></td>
 </tr>
</table>
<input type="submit" value="글수정">
</form>
<%
      rs.close();
      pstmt.close();
      conn.close();
      }

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>
</center>	
</body>
</html>