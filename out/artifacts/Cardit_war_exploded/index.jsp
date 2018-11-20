<%--
  Created by IntelliJ IDEA.
  User: Daeun
  Date: 2018-10-02
  Time: 오후 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<<<<<<< HEAD
  <head>
    <title>$Title$</title>
    <script src="script.js"></script>
  </head>
  <body>
  <h1>This is heading</h1>
  <p>This is a paragrah.</p>
  Hello, NanSsoGong!<<br/>
  <button onclick="runCode()">Click Me</button>
  </body>
=======
<head>
  <title>Card-it</title>

  <%-- css 파일 --%>
  <link rel="stylesheet" type="text/css" href="css/login.css">

  <%-- javascript --%>

</head>
<body>

<%--상단 메뉴 부분--%>
<header>

</header>

<%--로그인 화면 부분--%>
<main>
  <div id="login-page" class="login-page">
    <%-- Logo --%>
    <div class="logo">
      <div class="logo-header">
        <p>당신의 스케줄을 관리해보세요</p>
      </div>
      <div class="logo-main">
        <h1>Card-it !</h1>
      </div>
      <div class="logo-footer">
        <p><a href="calendar.jsp">card-it</a>이 무엇인가요?</p>
      </div>
    </div>
    <%-- login, sign up --%>
    <div class="login">
      <form class="login-form" action="main.jsp">
        <h1>Card-it</h1>
        <input type="text" placeholder="아이디" name="user_id" required>
        <input type="password" placeholder="비밀번호" name="user_pwd" required>
        <button>로그인</button>
        <p class="bar">──────── 혹은 ────────</p>
        <p class="message">비밀번호를 읽어버리셨나요?</p>
        <p class="message">계정이 없으신가요? <a href="#">가입하기</a></p>
      </form>
      <form id="sign-up-form" class="sign-up-form" action="main.jsp">
        <h1>Card-it</h1>
        <input type="text" placeholder="이름" name="user_name">
        <input type="text" placeholder="아이디" name="user_id">
        <input type="password" placeholder="비밀번호" name="user_pwd">
        <input type="password" placeholder="비밀번호 확인" name="user_pwd_check">
        <input type="text" placeholder="전화번호" name="user_phone">
        <input type="email" placeholder="이메일" name="user_email">
        <button>회원가입</button>
        <p class="message">Already registered? <a href="#">로그인</a></p>
      </form>
    </div>
  </div>
</main>

<%-- 예비 --%>
<footer>

</footer>

<script>
    $('.message a').click(function(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
</script>

</body>
>>>>>>> 704d1eed5d0e66ab32af510b1e8fcfd83d34ea64
</html>
