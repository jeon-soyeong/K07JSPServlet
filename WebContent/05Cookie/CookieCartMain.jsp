<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키를 읽어온다.
Cookie[] cookies = request.getCookies();
//문자열을 연결하기 위한 객체를 생성한다.
StringBuffer buffer =  new StringBuffer();
/*  
가져온 쿠키를 읽어서 만약 쿠키값에 product 문자열이 포함되어 있다면
buffer 참조변수에 문자열을 계속해서 연결한다.
문자열의 변경이 빈번하게 발생되는 경우 String클래스보다 StringBuffer
클래스를 사용하는 것이 좋다. 
*/
if(cookies!=null){
	for(Cookie ck : cookies){
		if(ck.getValue().contains("product")){
			System.out.println("쿠키값:" + ck.getValue());
			buffer.append(ck.getValue());
		}
	}
	System.out.println("생성된문자열(buffer):" +  buffer);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieCartMain.jsp</title>
</head>
<body>
	<h2>쿠키를 이용한 장바구니 예제</h2>
	
	<form action="CookieCartResult.jsp">
	<table border="1" cellpadding="10">
		<tr>
			<td>
			<!--  
			StringBuffer형 문자열에 각 value값이 포함되었는지를 확인해서
			있다면 checked속성을 활성화한다.
			-->
			<input type="checkbox" name="cart" value="product1"
			<% if(buffer.indexOf("product1")!=-1) {%>
				checked="checked"
			<% } %>
			 />상품1
			 &nbsp;&nbsp;
			 <input type="checkbox" name="cart" value="product2"
			<% if(buffer.indexOf("product2")!=-1) {%>
				checked="checked"
			<% } %>
			 />상품2
			 &nbsp;&nbsp;
			 <input type="checkbox" name="cart" value="product3"
			<% if(buffer.indexOf("product3")!=-1) {%>
				checked="checked"
			<% } %>
			 />상품3
			 &nbsp;&nbsp;
			 <input type="checkbox" name="cart" value="product4"
			<% if(buffer.indexOf("product4")!=-1) {%>
				checked="checked"
			<% } %>
			 />상품4
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">
				<input type="submit" value="장바구니담기" />
			</td>
		</tr>
	</table>
	</form>
	<form action="CookieCartEmpty.jsp">
		<input type="submit" value="장바구니비우기" />
	</form>
</body>
</html>