<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
.button {
  background:#4F81BD;
  border:0;	color:#fff;
  font-size:20px;	width:150px;
  margin:20px auto auto 60px;	padding:10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}
 </style>
</head>
<body>
<form action="insert.jsp" method=post> <!-- 입력완료 -->
 <table align="center">
  <tr>
   <th> 글제목 </th>
   <td><input type="text" id="subject" name="subject"></td>
  </tr>
  <tr>
   <th> 글내용 </th>
   <td><textarea id="comment" name="comment"></textarea></td>
  </tr>
  <tr>
   <td><input type="submit" class="button" value="입력완료" ></td>
   <td><input type="reset" class="button" value="다시작성"></td>
  </tr>
 </table>
 </form>
</body>
</html>