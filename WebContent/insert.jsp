<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<center>
<%	
String id = (String)session.getAttribute("id");
String subject = request.getParameter("subject");
String rcomment=request.getParameter("comment");
String comment = rcomment.replaceAll("\n", "<br>");
Timestamp register = new Timestamp(System.currentTimeMillis());
%>

<%
Connection conn=null;				//커넥션 객체
PreparedStatement pstmt =null;  //쿼리수행시키기위해준비하는객체
String str="";
try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	out.println("\n");

	String sql ="insert into board(uid, subject,comment,reg_data) values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql); 
	pstmt.setString(1,id);
	pstmt.setString(2,subject);
	pstmt.setString(3, comment);
	pstmt.setTimestamp(4, register);
	pstmt.executeUpdate();
	
	 %>
     <script type="text/javascript">
     alert("글쓰기");
      location.href="index2.jsp?target=list";
     </script>
     <%
	
}catch(Exception e){
	e.printStackTrace();
	out.println("글쓰기를 실패하였습니다");
	
}finally{
	if(pstmt !=null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn !=null)
		try{conn.close();}catch(SQLException sqle){}
}

%>
		
		</center>
</body>
</html>