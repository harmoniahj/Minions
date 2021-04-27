<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageUp</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  String idt = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  String name = request.getParameter("name");
  String adress=request.getParameter("adress");
  String tel=request.getParameter("tel");	
  ResultSet rs = null;
  try {
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection conn = null;
   String jdbcUrl="jdbc:mysql://localhost:3309/jspdb02";
   String dbId="jspid2";
   String dbPass="jsp2018";
   conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
   PreparedStatement pstmt = null;
   String sql = "";
   
   sql = "select passwd from member where id=?";
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, idt);
   rs = pstmt.executeQuery();
   if(rs.next()){
    String dbpass=rs.getString("passwd");
    if(passwd.equals(dbpass)){
     //비밀번호 맞음 수정
     
     sql = "update member set name=?, adress=?, tel=? where id=? and passwd=?";
     pstmt=conn.prepareStatement(sql);
     pstmt.setString(5, passwd);
     pstmt.setString(4, idt);
	 pstmt.setString(1, name);
	 pstmt.setString(2, adress);
	 pstmt.setString(3, tel);
        
     // 4단계 실행
     pstmt.executeUpdate(); //insert,update,delete
     %>
     <script type="text/javascript">
     alert("회원정보가 수정 되었습니다.");
     location.href="index2.jsp?target=mypage";
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
    alert("id가 존재x");
    history.back();
    </script><%
   }
   
  } catch (Exception e) {
   e.printStackTrace();
  }finally{
   
  }
 %>

</body>
</html>