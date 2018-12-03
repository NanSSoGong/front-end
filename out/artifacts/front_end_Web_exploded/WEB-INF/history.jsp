<%--
  Created by IntelliJ IDEA.
  User: shin-yeji
  Date: 12/11/2018
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Histroy | cardit</title>

    <%-- 반응형 웹에 사용될 수 있는 meta 태그 --%>
    <meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">

    <%-- css 파일 --%>
    <link rel="stylesheet" type="text/css" href="css/history.css">

    <%-- jquery 기본 파일 --%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.ui.js"></script>
    <script type="text/javascript" src="js/board.js"></script>
</head>

<body>

<script>

    //추가했습니다////필요합니다////
    //var token = sessionStorage.getItem("user_token");
    var token = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE1NDM4MTg1NzQsImV4cCI6MTU0NjQxMDU3NH0.fGAuub9Qean8dXUUEmfldjlQ4a7nxe09-buwFQzwv-w;
    var myUrl = 'http://localhost:3000/api/history/';
    var parm_board = 1;

    $(document).ready(function() {
        if(!token) location.replace("index.jsp");
    });

    var getJson = function(method, url, body, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('authorization', token);
        xhr.responseType = 'json';
        xhr.onload = function() {
            callback(xhr.status, xhr.response);
        };
    };
    // 로그인
    function history() {
        getJson('GET', myUrl.concat(parm_board), body, function (status, response) {
            alert("status : "+status);
            alert(response);

            if(status == 201) { // 성공
                alert(response.data.history_string);
                var history_string = response.data.history_string;
                var history_d_day = response.data.d_day;
            }
            else { // 실패
                alert("실패");
            }
        })
    }
</script>


<%-- top menu --%>
<header>
    <a href="main.jsp" class="home-box image"><img src="image/home.png" class="home-button"></a>
    <a href="#" class="header-logo"><img src="image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="image/user.png" class="user-image"></a>
    </div>
</header>

<section class="sub-header">
    <div class="search-bar">
        <input type="text" name="search" placeholder="   검색">
    </div>
</section>

<main>
    <div class="history-header">
        History
    </div>

    <br><hr width="1170px" color="#707070" >

    <div class="histroy-image-margin">
        <img class="history-image-margin" src="image/history.png">
        <b class="margin-left50">YEJI</b> deleted a <b>공지사항</b> list
        <font class="float-right">3 days ago</font>
    </div>

    <div class="histroy-image-margin">
        <img class="history-image-margin" src="image/history.png">
        <b class="margin-left50">DAEUN</b> create a <b>NanSSoGong</b> Board
        <font class="float-right">7 days ago</font>
    </div>

    <div class="histroy-image-margin">
        <img class="history-image-margin" src="image/history.png">
        <b class="margin-left50">SUNGHWAN</b> added a <b>TO DO</b> list
        <font class="float-right">11 days ago</font>
    </div>

    <div class="histroy-image-margin">
        <img class="history-image-margin" src="image/history.png">
        <b class="margin-left50">YOUNGJIN</b> invited a <b>DAEUN</b>
        <font class="float-right">18 days ago</font>
    </div>

</main>
</body>
</html>