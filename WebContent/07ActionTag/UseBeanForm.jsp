<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanForm.jsp</title>
</head>
<body>
	<h2>회원가입화면(속성 일치시)</h2>
	<form method="post" action="UseBeanFormResult.jsp">
	<table border="1" width="400">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" />
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="pass" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입완료" />
			</td>
		</tr>
	</table>	
	</form>	
</body>
</html>