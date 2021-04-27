<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style>
.b input {
  display:block;
  width:230px; height :10px ; padding:15px;
  margin : 10px auto 20px auto;
  background:rgba(0,0,0,0.03);
  color: #4F81BD; border:0;	}

 .button {
  background:#4F81BD;
  border:0;	color:#fff;
  font-size:20px;	width:230px;
  margin:20px auto auto 60px;	padding:10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}
 </style>
</head>
<body>
<%
String id =(String)session.getAttribute("id");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
	String dbId="jspid2";
	String dbPass="jsp2018";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select * from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	while(rs.next()){
		String idt = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String adress = rs.getString("adress");
		String tel = rs.getString("tel");
%>

<table>
<form action="mypageUp.jsp" method="post">
<table  width="30%" align="center" height="100%">
 <tr>
  <td colspan="2" align="center"> <img src="img/up_title.png" width="200">
 </tr>
 <tr >
  <td>아이디</td>
  <td class="b"> <input type=text name="id" value="<%= idt %>"/>  </td> 
 </tr>
 <tr>
 <td>비밀번호</td> 
 <td class="b"> <input type=password name="passwd"> </td>
 </tr>
 <tr >
 <td>이름</td> <td class="b"> <input type="text" name="name" value="<%= name %>"/> </td>
 </tr>
 <tr>
 <td>주소</td> <td class="b"> <input type="text" name="adress" value="<%= adress %>"/> </td>
 </tr>
 <tr>
 <td> 휴대전화 </td> <td  class="b">
 <input type="text" name="tel"  value="<%= tel %>"/>
 </td>
 </tr>
 <tr>
 <td> <input type="submit" class="button" value="회원정보 수정" > </td>
 </tr>
 </table>
</form>
<%
	}	
}catch(Exception e){
	
}finally{
	if(rs != null)
		try{rs.close();}catch(SQLException sqle){}
	
	if(pstmt != null)
		try{pstmt.close();}catch(SQLException sqle){}
	
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>
</table>
</body>
</html>