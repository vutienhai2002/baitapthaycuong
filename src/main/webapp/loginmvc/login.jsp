<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	String msg = (String) request.getAttribute("message");
	if(msg != null){
		out.print(msg);
	}
	%>
<form action="LoginController.jsp" method="POST">
		Username: <input type="text" name="username"><br>
		Password: <input type="password" name="password"><br>
		<input type="submit" value="LOGIN">
	</form>
</body>
</html>