<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01Set</title>
</head>
<body>
	<!--  
	set 태그속성
		var : 변수명. 문자열만 가능함
		value : 값. 표현식, EL식 모두 가능함
		scope : 영역을 지정. 문자열만 가능하고 4가지 영역을
			지정할 수 있음. 기본값은 가장좁은  page영역.
	즉, set태그를 사용하여 변수를 저장하면  지정된 영역에 저장된다.
	-->
	<h2>set태그</h2>
	<h3>set태그로 EL에서 사용할 변수 설정하기</h3>
	<ul>
		<li>
		1.value속성에 직접 값 대입:
			<c:set var="directVar" value="100" />
		</li>
		<li>
		2.value속성에 EL로 값 대입 :
			<c:set var="elVar" value="${directVar mod 5}" />
		</li>
		<li>
		3.value속성에 표현식으로 값 대입:
			<c:set var="expVar" value="<%=new Date() %>" />
			<!-- java.util -->
		</li>
		<li>
		4.시작태그와 종료태그 사이에 값 설정:
			<c:set var="betweenVar">
				변수값 요렇게 설정
			</c:set>
		</li>
	</ul>
	<h3>set태그로 설정한 데이터 표현식으로 출력</h3>
	<ul>
		<li>
			directVar : <%=pageContext.getAttribute("directVar") %>
		</li>
		<li>
			elVar : <%=pageContext.getAttribute("elVar") %>
		</li>
		<li>
			expVar : <%=pageContext.getAttribute("expVar") %>
		</li>
		<li>
			betweenVar : <%=pageContext.getAttribute("betweenVar") %>
		</li>
	</ul>
	<h3>EL로 출력</h3>
	<!--  
		EL로 영역의 속성을 읽어올때는 XXXScope를 생략하면 가장 좁은
		page영역을 읽어오게 된다. 즉 아래는 모두 page영역을 읽어오게된다.
	-->
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar : ${elVar }</li>
		<li>expVar : ${expVar }</li>
		<li>betweenVar : ${betweenVar }</li>
	</ul>
	
	<h2>set태그로 자바빈 객체설정</h2>
	
	<h3>인자생성자로 설정</h3>
	<!-- 인자생성자를 통해 DTO객체를 생성한 후 request영역에 속성을 저장한다. -->
	<c:set var="argsMember"
		value='<%=new MemberDTO("KIM", "1111", "김태희", null) %>'
		scope = "request" />
	
	<!-- 영역에 저장될 때는 Object타입으로 자동형변환되므로 사용시
	해당 자료형으로 변환(다운캐스팅)해야 한다. -->
	<h3>JSP코드로 출력</h3>
	<ul>
		<li>아이디 :
			<%=((MemberDTO)request.getAttribute("argsMember")).getId() %>
		</li>
		<li>이름 :
			<%=((MemberDTO)request.getAttribute("argsMember")).getName() %>
		</li>
	</ul>
	
	<!-- EL로 출력시에는 별도의 형변환이 필요없고, 속성명이 중복되지
	않는다면 XXXScope 내장객체를 생략할 수도 있다. -->
	<h3>EL로 출력</h3>
	<ul>
		<li>아이디 : ${requestScope.argsMember.id }</li>
		<li>이름 : ${argsMember.name }</li>
	</ul>
	
	
	<!--  
	set태그의 target, property속성은 자바빈 객체의 속성 혹은
	컬렉션의 값을 설정할 때 사용하는 속성이다. 
	target : 변수값을 지정하는 속성. 반드시 EL, 표현식만 가능
	property : 값을 지정하는 속성. 표현식, EL, 값 모두 표현가능
		-자바빈 인 경우 : 속성명(멤버변수)
		-Map 컬렉션인 경우 : 키값
		
	※scope속성은  var속성이 지정된 태그에서만 지정 가능함
	※target과  property를 사용해서 자바빈이나 컬렉션에 값을
	설정할 때는 var속성을 지정할 수 없다.
	-->
	<h3>target속성과 property속성 사용하기</h3>
	<!-- 1.변수생성 -->
	<c:set var="defalutMember" value="<%=new MemberDTO() %>"
	scope="request" />
	
	<!-- 2.생성된 변수의 멤버변수값 지정 -->
	<c:set target="${defalutMember }" property="id"
		value="Jung"/>
	<c:set target="${defalutMember }" property="pass"
		value="9999"/>
	<c:set target="${defalutMember }" property="name"
		value="정지훈"/>
	<!-- 3.저장된 값을 EL로 출력. -->
	<h3>target 및 property 속성으로 설정 후 출력</h3>
	<ul>
		<li>아이디 :  ${requestScope.defalutMember.id }</li>
		<li>비번 :  ${defalutMember.pass }</li>
		<li>이름 :  ${defalutMember.name }</li>
	</ul>
	
	<!--  
	List계열의 컬렉션은 배열처럼 순서를 보장하고, 인덱스로 접근되므로
	객체에 접근시에는 인덱스를 이용한다. 
	-->
	<h2>List 컬렉션 이용하기</h2>
	<%
	List list =  new Vector();
	list.add(request.getAttribute("defalutMember"));//-> 0번 index
	list.add(request.getAttribute("argsMember"));//-> 1번 index
	%>
	
	<h4>1단계:set태그로 리스트계열 컬렉션 설정</h4>
	<c:set var="list" value="<%=list %>" scope="request"/>
	
	<!-- 0번 인덱스이므로 defalutMember 객체에 접근. -->
	<h4>target 및 property 미설정 후 출력 </h4>
	<!-- 기존에 저장되었던 "정지훈" 정보가 출력된다. -->
	<ul>
		<li>아이디:${requestScope.list[0].id }</li>
		<li>비번:${requestScope.list[0].pass }</li>
		<li>이름:${requestScope.list[0].name }</li>
	</ul>
	
	<h4>2단계:target 및 property속성으로 속성값 변경</h4>
	<c:set target="${list[0] }" property="id" value="BTS" />
	<c:set target="${list[0] }" property="pass" value="0000" />
	<c:set target="${list[0] }" property="name" value="방탄소년단" />
	
	<h4>target 및 property 속성으로 설정 후 출력</h4>
	<!-- BTS 정보가 출력됨 -->
	<ul>
		<li>아이디:${requestScope.list[0].id }</li>
		<li>비번:${list[0].pass }</li>
		<li>이름:${list[0].name }</li>
	</ul>
	
	
	<!--  
	Map계열의 컬렉션은 Key값을 통해 value에 접근한다. Key를 통한 접근이
	index를 통한 접근보다 속도가 빠르다. 
	-->
	<h2>Map 컬렉션 이용하기</h2>
	<%
	Map map = new HashMap();
	map.put("def", request.getAttribute("defalutMember"));
	map.put("args", request.getAttribute("argsMember"));
	%>
	<h4>1단계 : set태그로 맵 컬렉션 설정</h4>
	<c:set var="map" value="<%=map %>" scope="request"/>
	
	<h4>2단계 : target 및 property속성으로 속성값 설정</h4>
	<c:set target="${map.args }" property="id" value="AOA" />
	<c:set target="${map.args }" property="pass" value="7777" />
	<c:set target="${map.args }" property="name" value="설현짱" />
	
	<h4>속성값 변경 후 출력</h4>
	<ul>
		<li>아이디:${map.args.id }</li>
		<li>비번:${map.args.pass }</li>
		<li>이름:${map.args.name }</li>
	</ul>
</body>
</html>