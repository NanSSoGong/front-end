<%--
  Created by IntelliJ IDEA.
  User: Daeun
  Date: 2018-10-02
  Time: 오후 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Card-it</title>

  <%-- css 파일 --%>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <style>
    @media screen and (max-width: 1000px) {
      .logo {
        display: none;
      }
    }
  </style>

  <%-- javascript --%>
  <script type="text/javascript" src="js/jquery.min.js"></script>
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
      <form class="login-form" name="loginForm">
        <h1>Card-it</h1>
        <input type="text" placeholder="아이디" name="user_id">
        <input type="password" placeholder="비밀번호" name="user_pwd" onkeyup="if(event.keyCode==13){login()}">
        <button type="button" onclick="login()">로그인</button>
        <p class="bar">──────── 혹은 ────────</p>
        <p class="message">비밀번호를 읽어버리셨나요?</p>
        <p class="message">계정이 없으신가요? <a href="#">가입하기</a></p>
      </form>
      <form class="sign-up-form" name="signUpForm">
        <h1>Card-it</h1>
        <input type="text" placeholder="이름" name="user_name">
        <input type="text" placeholder="아이디" name="user_id">
        <input type="password" placeholder="비밀번호" name="user_pwd">
        <input type="password" placeholder="비밀번호 확인" name="user_pwd_check">
        <input type="text" placeholder="전화번호" name="user_phone">
        <input type="email" placeholder="이메일" name="user_email">
        <button type="button" onclick="signUp()">회원가입</button>
        <p class="message">이미 아이디가 있으신가요? <a href="#">로그인</a></p>
      </form>
    </div>
  </div>
</main>

<%-- 예비 --%>
<footer>

</footer>

<script>
    var token = sessionStorage.getItem("user_token");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/user/';

    $(document).ready(function() {
        if(token) location.replace("main.jsp");
    });

    $('.message a').click(function(){
        changeMode();
    });

    function changeMode(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    }

    // input 값이 비었는지 확인
    function isEmpty(obj, msg) {
        if(obj.value=="") {
            alert(msg);
            obj.focus();
            return true;
        }

        return false;
    }
    // 비밀번호 확인과 같은지 확인
    function isSame(pwd1, pwd2) {
        if(pwd1 === pwd2) return true;
        else {
            alert("비밀번호가 일치하지 않습니다.");

            return false;
        }
    }
    var getJson = function(method, url, body, callback) {

        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.responseType = 'json';
        xhr.onload = function() {
            callback(xhr.status, xhr.response);
        };

        if(body) {
            var data = JSON.stringify(body);
            xhr.send(data);
            //alert("전송");
        }
        else {
            xhr.send();
            //alert("실패");
        }

    };

    // 로그인
    function login() {
        var f = document.loginForm;
        var id = f.user_id.value;
        var pw = f.user_pwd.value;
        var body = {
            "user_id": id,
            "user_pwd": pw
        };

        if(isEmpty(f.user_id, "ID를 입력하세요.")) return false;
        if(isEmpty(f.user_pwd, "비밀번호를 입력하세요.")) return false;

        getJson('POST', myUrl.concat('login/'), body, function (status, response) {
            if(status == 201) { // 성공
                sessionStorage.setItem("user_token", response.data.token);
                sessionStorage.setItem("user_idx", response.data.user_idx);
                sessionStorage.setItem("user_name", response.data.user_name);
                sessionStorage.setItem("user_email", response.data.user_email);
                sessionStorage.setItem("user_phone", response.data.user_phone);
                sessionStorage.setItem("user_id", response.data.user_id);

                location.href = "main.jsp";
            }
            else {
                if(response.message == "Login Failed") alert("아이디 혹은 패스워드가 일치하지 않습니다.");
                else alert("로그인에 실패했습니다. Error Code : " + status);
            }
        })
    }

    // 회원가입
    function signUp() {
        var f = document.signUpForm;
        var name = f.user_name.value;
        var id = f.user_id.value;
        var pwd = f.user_pwd.value;
        var pwd_check = f.user_pwd_check.value;
        var phone = f.user_phone.value;
        var email = f.user_email.value;

        if(isEmpty(f.user_name, "이름을 입력해주세요.")) return false;
        if(isEmpty(f.user_id, "ID를 입력해주세요."))  return false;
        if(isEmpty(f.user_pwd, "비밀번호를 입력해주세요.")) return false;
        if(!isSame(pwd, pwd_check)) {
            f.user_pwd_check.focus();
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        var body = {
            "user_name" : name,
            "user_phone" : phone,
            "user_email" : email,
            "user_id" : id,
            "user_pwd" : pwd
        };

        getJson('POST', myUrl.concat('signup/'), body, function (status, response) {
            if(status == 201) { // 성공
                alert("회원가입에 성공하였습니다.");
                changeMode();
            }
            else if(status == 400) { // 실패
                if (response.message == "Null Value") alert("회원가입에 실패했습니다. Error Code : " + status);
                else alert("이미 존재하는 아이디입니다.");
            }
            else { // 오류
                alert("회원가입에 실패했습니다. Error Code : " + status);
            }
        })
    }
</script>


</body>
</html>