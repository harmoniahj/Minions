<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 삭제</title>
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

  <table class="body" border=2>
    <tr>

      <th style="height:40px;">글제목</th>
	  
      <td><%=subject%></td>

    </tr>
    <tr>

      <th style="height:200px;">글내용</th>

      <td style=" width:500px;"><%=comment%></td>

    </tr>
	<tr>

      <th style="height:40px;">날짜</th>
	  
      <td><%=date%></td>

    </tr>
  </table>

  <%
      rs.close();
      pstmt.close();
      conn.close();
      }

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>
  <br>
    <a href="index2.jsp?target=up&bid=<%=num%>"><input type="button" id="update" value="수정"></a>
   <a href="index2.jsp?target=del&bid=<%=num%>"> <input type="button" id="delete" value="삭제"></a>
	<a href="index2.jsp?target=list"><input type="button" id="list" value="목록"></a>
 
</center>
</body>
</html>