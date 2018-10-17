<%--
  Created by IntelliJ IDEA.
  User: iua94
  Date: 2018-10-17
  Time: 오전 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Board | cardit</title>

    <%-- css 파일 --%>
    <link rel="stylesheet" type="text/css" href="../../../front-end/web/css/board.css">

    <%-- jquery 기본 파일 --%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.ui.js"></script>
    <script type="text/javascript" src="js/board.js"></script>
</head>

<body>
<%-- top menu --%>
<header>
    <a href="main.jsp" class="home-box image"><img src="../../../front-end/web/image/outline-home-24px.svg" class="home-button"></a>
    <a href="#" class="header-logo"><img src="../../../front-end/web/image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="../../../front-end/web/image/round-face-24px.svg" class="user-image"></a>
    </div>
</header>
<section class="sub-header">
    <div class="search-bar">
        <input type="text" name="search" placeholder="   검색">
    </div>
</section>
<main>
    <div id="listName1" class="list sortable">
        <div class="list-header">
            <span class="list-name">To Do</span>
            <a href="#" class="list-tool-button-box"><img src="../../../front-end/web/image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
        </div>
        <ul class="list-contents">
            <li class="card">SOW 보고서 쓰기</li>
            <li class="card">프로젝트 이름 정하기</li>
        </ul>
        <img src="../../../front-end/web/image/baseline-add_circle_outline-24px.svg" class="add-card-button">
    </div>
    <div id="listName2" class="list sortable">
        <div class="list-header">
            <span class="list-name">Doing</span>
            <a href="#" class="list-tool-button-box"><img src="../../../front-end/web/image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
        </div>
        <ul class="list-contents">
            <li class="card">UI 디자인 완성하기</li>
        </ul>
        <img src="../../../front-end/web/image/baseline-add_circle_outline-24px.svg" class="add-card-button">
    </div>
    <div id="listName3" class="list sortable">
        <div class="list-header">
            <span class="list-name">사야할 것</span>
            <a href="#" class="list-tool-button-box"><img src="../../../front-end/web/image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
        </div>
        <ul class="list-contents">
            <li class="card">노트북</li>
            <li class="card">교과서, 부교재</li>
        </ul>
        <img src="../../../front-end/web/image/baseline-add_circle_outline-24px.svg" class="add-card-button">
    </div>
    <div id="listName4" class="list sortable">
        <div class="list-header">
            <span class="list-name">Done</span>
            <a href="#" class="list-tool-button-box"><img src="../../../front-end/web/image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
        </div>
        <ul class="list-contents">
            <li class="card">UI 디자인 완성하기</li>
        </ul>
        <img src="../../../front-end/web/image/baseline-add_circle_outline-24px.svg" class="add-card-button">
    </div>
    <div id="listName5" class="list sortable">
        <div class="list-header">
            <span class="list-name">공지사항</span>
            <a href="#" class="list-tool-button-box"><img src="../../../front-end/web/image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
        </div>
        <ul class="list-contents">
            <li class="card">여러분 화이팅 합시다!</li>
            <li class="card">회의는 매주 목요일 12시</li>
        </ul>
        <img src="../../../front-end/web/image/baseline-add_circle_outline-24px.svg" class="add-card-button">
    </div>
</main>
</body>
</html>