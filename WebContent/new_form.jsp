<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<style>
.b { align: center; }
table { text-align : center;}
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
  padding:10px; margin : 10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}
 </style>
</head>
<body>
<form action="new.jsp" method="post">
<table width="30%" align="center" height="100%">
 <tr>
  <td colspan="2" align="center"> <img src="img/n_title.png" width="200"> </td>
 </tr>
 <tr>
  <td>아이디</td>
  <td class="b"> <input type=text name="id"placeholder="아이디 입력" maxlength="8"> </td>
 </tr>
 <tr>
 <td>비밀번호</td> 
 <td class="b"> <input type=password name="passwd" placeholder="4~10자리 입력" maxlength="10"> </td>
 </tr>
 <tr >
 <td>이름</td> <td class="b"> <input type="text" name="name" placeholder="진현주"> </td>
 </tr>
 <tr>
 <td>주소</td> <td class="b"> <input type="text" name="adress" placeholder="서울시 구로구 오류 2동"> </td>
 </tr>
 <tr>
 <td> 휴대전화 </td> <td  class="b">
 <input type="text" name="tel" placeholder="010-0000-0000" maxlength="11">
 </td>
 </tr>
 <tr>
 <td colspan="2" align="center"> <input type="submit" class="button" value="회원가입" > </td>
 </tr>
 </table>
</form>
</body>
</html>