<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
 #subject{width:730px; height:30px;}
 #comment{width:730px; height:300px;}
 
 .button {
  background:#4F81BD;
  border:0;	color:#fff; 
  font-size:20px;	width:230px;
  margin:auto;	padding:10px;
  display:block; cursor:pointer;	}
 
 .button:active { background:#728A98;	}

 </style>
</head>
<body>
<center>
<form action="insert.jsp" method=post>
 <table>
  <tr> <th>글제목</th>
   <td><input type="text" id="subject" name="subject"></td>
 </tr>
 <tr> <th>글내용</th>
  <td><textarea id="comment" name="comment"></textarea></td>
 </tr>
 <tr align="center">
   <td colspan="2"><input type=submit value="입력완료" class="button"></td>
  </tr>
 </table>
</form>
</center>
</body>
</html>