<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieCartResult.jsp</title>
</head>
<body>
	<%
	/*  
	전송된 checkbox항목을 받아서 String타입의 배열로 저장한다.
	*/
	String[] products = request.getParameterValues("cart");
	for(String goods : products){
		/*  
		쿠키를 생성할 때 이름과 값을 동일하게 설정한다.
		경로는 설정되었지만, 유효기간이 설정되지 않았으므로 해당
		쿠키는 웹브라우저를 닫을 때 같이 소멸된다.
		단, 탭만 닫는 것은 의미가 없고 웹브라우저 자체를 닫았을 때 쿠키가
		소멸된다.
		*/
		Cookie cookie = new Cookie(goods, goods);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}
	%>
	<h2>장바구니에 담을 상품을 대상으로 쿠키생성</h2>
	<script>
		alert("장바구니에 상품을 저장했습니다.");
		location.href="CookieCartMain.jsp";
	</script>
</body>
</html>