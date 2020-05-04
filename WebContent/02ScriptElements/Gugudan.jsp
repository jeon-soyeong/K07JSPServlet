<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
</head>
<body>
	<h2>JSP로 구구단 출력하기</h2>
	<%!
	public void showGugudan(JspWriter out){
		try{
		out.println("<table border='1' width='700'>");
		
		for(int i = 2; i<=9; i++){
			out.println("<tr>");
			for(int j = 1; j<=9; j++){
				out.println("<td>"+ i +"*"+ j +"="+(i*j) + "</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
		}
		catch(Exception e){}
	}
	%>
	<h3>구구단 출력1 - 메소드로 구현</h3>
	<%
		showGugudan(out);		
	%>
	
	 <script>
	 	var i = 10;
	 </script>
	 
	<h3>구구단 출력2 - 표현식으로 구현</h3>
	<table border="1" width="700">
		<% for(int i = 2; i <= 9; i++){%>
		<tr>
			<%for(int j = 1; j<=9; j++){%>
			<td><%=( i +"*"+ j +"="+(i*j)) %></td>
			<%}%>
		</tr>
		<%}%>
	</table>
	
	<!-- 정답 -->
	<h3>구구단 출력3 - 표현식으로 구현</h3>
	<table border="1" width="700">
		<%
		for(int dan=2; dan<=9; dan++){
		%>
		<tr>
			<%
				for(int su = 1; su<=9; su++){
			%>	
			<td><%=dan %>*<%=su %>=<%=(dan*su) %></td>
			<%
			}
			%>	
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>