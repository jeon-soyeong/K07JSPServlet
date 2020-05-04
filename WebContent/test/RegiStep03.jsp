<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
        
String id = request.getParameter("id");
String password = request.getParameter("password");
String email = request.getParameter("email");
String gender = request.getParameter("gender");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegiStep03.jsp</title>
	<style>
        .sign{
            border: 1px solid black; width: 500px; height: 20px;
            background-color: #f4ebeb;
        }
        .back{
            border: 1px solid black; width: 500px; height: 200px;
            background-color: white; 
            padding-top: 50px;
        }
        #bnt{
            margin-left: 130px;
            float: left;
            background-color: white;
        }
        .button:hover{
            background-color:#e5e5e5;
        } 
    </style>
     <script>
        function check() {
        	   alert(<%=id %>+"님 가입이 완료되었습니다");
        	   location.href='http://www.ikosmo.co.kr/';
		}
        function back() {
			history.back();
		}
      </script> 
</head>
<body>
	 <div class="sign">
        회원가입 완료
    </div>
    <div class="back" style= padding-bottom:50px;>
        <p style="padding-left: 40px;">
        
            아이디&nbsp;&nbsp;&nbsp;&nbsp;   <%=id %>
            <br> <br>
            비밀번호     <%=password %>
            <br> <br>
            이메일&nbsp;&nbsp;&nbsp;  <a href=""> <%=email %></a> 
            <br> <br>
            성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <%=gender %>
            <br> 
        </p>
       
        <input type="button" value="이전" id="bnt" onclick="back()" style=" border: 1px solid black; width: 120px; height: 30px; text-align: center; "/>
		<input type="button" value="확인" id="bnt" onclick="check()" style=" border: 1px solid black; width: 120px; height: 30px; text-align: center; margin-left: 20px;"/>
    </div>
</body>
</html>