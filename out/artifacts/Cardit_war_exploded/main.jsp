<%--
  Created by IntelliJ IDEA.
  User: iua94
  Date: 2018-10-13
  Time: 오후 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home | Card-it</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

    <style>



    </style>

</head>
<body>
<%-- top menu --%>
<header>
    <a href="main.jsp" class="header-logo"><img src="image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="image/user.png" class="user-image"></a>
    </div>
</header>


    <%-- search bar --%>
<section class="sub-header">
    <div class="search-bar">
        <input type="text" name="search" placeholder="검색">
    </div>
</section>

<main>
    <%-- side menu --%>
    <section class="side-menu float">
        <div class="side-menu-container">
            <ul id="board-list">
                <li id="<%--board-name--%>" class="board-li"><a href="board.jsp"><span>- NanSSoGong</span></a></li>
                <li id="<%--board-name--%>" class="board-li"><a href="board.jsp"><span>- EasyFunArt</span></a></li>
                <li id="<%--board-name--%>" class="board-li"><a href="board.jsp"><span>- HalMate</span></a></li>
            </ul>
            <button type="button" style="vertical-align:middle" onclick="document.getElementById('create-board-modal').style.display='block'"><div class="button-img-wrap"><img src="image/add.png"></div><span>Create a board</span></button>
        </div>
        <%--  create a board button 클릭 할 때 나오는 화면--%>
        <div id="create-board-modal">
            <form id="create-board-modal-contents">
                <div class="create-board-modal-header">
                    <span class="modal-header-name">Create a Board</span>
                    <img src="image/multiply.png" class="modal-close-button create-board-close-button" onclick="document.getElementById('create-board-modal').style.display='none'">
                </div>
                <hr style="width: 700px; border: 0; border-top:1px solid #707070;">
                <div class="container">
                    <span class="create-board-container-name">Board Name</span>
                    <input id="create-board-name" type="text">
                    <span class="create-board-container-bg">Background</span>
                    <ul class="color-button-container">
                        <li><button class="board-color-button" type="button" title="blue" style="background-color:#3178BA;"></button></li>
                        <li><button class="board-color-button" type="button" title="orange" style="background-color:#C99247;"></button></li>
                        <li><button class="board-color-button" type="button" title="green" style="background-color:#639646;"></button></li>
                        <li><button class="board-color-button" type="button" title="red" style="background-color:#A44C39;"></button></li>
                        <li><button class="board-color-button" type="button" title="purple" style="background-color:#83639A;"></button></li>
                        <li><button class="board-color-button" type="button" title="pink" style="background-color:#BF628F;"></button></li>
                        <li><button class="board-color-button" type="button" title="more color" style="background: #F6F6F6 url(/image/add.png) no-repeat; background-size: 20px 20px; background-position: 15px 15px;"></button></li>
                    </ul>
                    <span class="invite-user-span">Invite members</span>
                    <div class="invite-user"><input type="text" class="invite-user-name" placeholder="       search by user ID"></div>
                    <button class="invite-user-button">invite</button>
                </div>
                <button class="create-board-button">OK</button>
            </form>
        </div>
    </section>

    <%-- D-Day --%>
    <section class="d-day float">
        <div class="today">
            <div class="today-shadow"></div>
            <ul>
                <li><span class="today-header">TODAY</span></li>
                <li><span class="today-card-name">Home UI 완성하기</span></li>
                <li><span class="today-date">Oct, 4th (THU)</span></li>
            </ul>
        </div>
        <div class="d-day-list">
            <ul>
                <li>
                    <div class="card-list">
                        <div class="card-header">
                            <span class="board-name">NanSSoGong</span><span class="colon">: </span>
                            <span class="list-name">To Do</span>
                            <span class="d-day-number">D-2</span>
                        </div>
                        <div class="card-contents">
                            <span class="card-name">SOW 보고서 쓰기</span>
                            <span class="card-duedate">Due Date : Oct, 6th</span>
                        </div>
                        <button class="done-button">Done</button>
                        <button class="hide-button">Hide</button>
                    </div>
                </li>
                <li>
                    <div class="card-list">
                        <div class="card-header">
                            <span class="board-name">NanSSoGong</span><span class="colon">: </span>
                            <span class="list-name">To Do</span>
                            <span class="d-day-number">D-2</span>
                        </div>
                        <div class="card-contents">
                            <span class="card-name">SOW 보고서 쓰기</span>
                            <span class="card-duedate">Due Date : Oct, 6th</span>
                        </div>
                        <button class="done-button">Done</button>
                        <button class="hide-button">Hide</button>
                    </div>
                </li>
                <li>
                    <div class="card-list">
                        <div class="card-header">
                            <span class="board-name">NanSSoGong</span><span class="colon">: </span>
                            <span class="list-name">To Do</span>
                            <span class="d-day-number">D-2</span>
                        </div>
                        <div class="card-contents">
                            <span class="card-name">SOW 보고서 쓰기</span>
                            <span class="card-duedate">Due Date : Oct, 6th</span>
                        </div>
                        <button class="done-button">Done</button>
                        <button class="hide-button">Hide</button>
                    </div>
                </li>
                <li>
                    <div class="card-list">
                        <div class="card-header">
                            <span class="board-name">NanSSoGong</span><span class="colon">: </span>
                            <span class="list-name">To Do</span>
                            <span class="d-day-number">D-2</span>
                        </div>
                        <div class="card-contents">
                            <span class="card-name">SOW 보고서 쓰기</span>
                            <span class="card-duedate">Due Date : Oct, 6th</span>
                        </div>
                        <button class="done-button">Done</button>
                        <button class="hide-button">Hide</button>
                    </div>
                </li>
            </ul>
        </div>

    </section>

    <%-- Calendar --%>
    <section class="calendar float">



    </section>
</main>

<%--???--%>
<footer>

</footer>

<script></script>
</body>
</html>
