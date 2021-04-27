<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	//id passwd가져오기
 request.setCharacterEncoding("utf-8");
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 
 ResultSet rs = null;
 Connection con = null;

 String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
 String dbId="jspid2";
 String dbPass="jsp2018";
 PreparedStatement pstmt = null;
 String sql = "";

 try{ // 드라이버 로더
 Class.forName("com.mysql.jdbc.Driver"); 
 con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 sql = "select passwd from member where id=?;";  // id에 해당하는 passwd가져오기
 pstmt = con.prepareStatement(sql);
 pstmt.setString(1, id);
 rs = pstmt.executeQuery(); // 실행 => rs
 if(rs.next()){ 
 String dbpass=rs.getString("passwd");
 if(passwd.equals(dbpass)){
  session.setAttribute("id", id);
%>
   <script type="text/javascript">
   alert("로그인이 되었습니다.");
   location.href="index2.jsp";
   </script>
   <%
  }else{
   %>
   <script type="text/javascript">
   alert("비밀번호 오류");
   history.back();
   </script><%
  }
 }else{
  %>
  <script type="text/javascript">
  alert("id가 존재하지 않습니다.");
  history.back();
  </script><%
 }
}catch (Exception e) {
 e.printStackTrace();
}finally{ // rs!=null : 기억장소가 확보되어 있다는 뜻
 if(rs!=null)try{rs.close();}catch(SQLException ex){}
 if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
 if(con!=null)try{con.close();}catch(SQLException ex){}
}
%>
</body>
</html>