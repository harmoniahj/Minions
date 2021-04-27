<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String target = request.getParameter("target");
 if(target == null) target ="home";
 String targetPage= target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body bgcolor="#FFFF8F">
<table width="100%">
  <tr> <!-- 위 -->
	<td colspan="2">
    <jsp:include page="include/top.jsp" flush="false" />
	</td>
	<td rowspan="2" valign="top" width="200"> <!-- 오른쪽 -->
	<img style="margin-right:5px" src="img/right.png" width="150" border="0"/>
	<jsp:include page="include/right.jsp" flush="false" />
	</td>
  </tr>
  <tr> <!-- 왼쪽 -->
  	<td valign="top" width="100">
  	<jsp:include page="include/left.jsp" flush="false" />
	<img src="img/bottom.png" width="250" height="300" border="0" align="bottom"/>
  	</td>
	<td width="100%" valign="middle" bgcolor="#ffffff"> 
	<jsp:include page="<%= targetPage %>" flush="false" />
	</td>
</table>
</body>
</html>