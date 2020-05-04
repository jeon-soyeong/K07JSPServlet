<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseMain.jsp</title>
</head>
<body>
	<h2>sendRedirect테스트(if문 사용하기)</h2>
	<form action="./ResponseSendRedirect.jsp" method="post">
	<table border="1" width="300">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="user_id" />
			</td>	
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="user_pwd" />
			</td>	
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" />
			</td>	
		</tr>
	</table>
	</form>
	
	
	
	<h2>sendRedirect테스트(JDBC 사용하기)</h2>
	<form action="./ResponseJDBC.jsp" method="post">
	<table border="1" width="300">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="user_id" />
			</td>	
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="user_pwd" />
			</td>	
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" />
			</td>	
		</tr>
	</table>
	</form>
	
</body>
</html>