<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
 
 .box {	padding:30px 0px; }
 
 .box input {
  display:block;
  width:300px;
  margin:10px auto;		padding:15px;
  background:rgba(0,0,0,0.03);
  color:#4F81BD; border:0;	}
 
 .button {
  background:#4F81BD;
  border:0;	color:#fff;
  font-size:20px;	width:330px;
  margin:10px auto;	padding:10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}

  </style>
</head>
<body>
 <form action="login.jsp" method="post">
  <table border="0" align = "center">
   <tr  align="center">
     <td> <img src="img/lo-title.png" width="200">
   </td>
   </tr>
   <tr class="box" align="center">
     <td> <input type="text" name="id" placeholder="아이디 입력" maxlength="8"> </td>
   </tr>
   <tr class="box" align="center">
     <td> <input type="password" name="passwd" placeholder="비밀번호 입력" maxlength="10"> </td>
   </tr>
   <tr>
     <td> <input type="submit" class="button" value="login" > </td>
   </tr>
  </table>
 </form>
</body>
</html>