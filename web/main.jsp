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
</head>
<body>
<%-- top menu --%>
<header>
    <a href="#" class="header-logo"><img src="image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="image/round-face-24px.svg" class="user-image"></a>
    </div>
</header>

<main>
    <%-- search bar --%>
    <div class="search-bar">
        <input type="text" name="search" placeholder="검색">
    </div>

    <%-- side menu --%>
    <section class="side-menu float">
        <div>
            <ul id="board-list">
                <a href="board.jsp"><li id="board-name" class="board-li">new</li></a>
            </ul>
            <button id="create-board" type="button" onclick="document.getElementById('create-board-modal').style.display='block'">board</button>
        </div>
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
        <div>

        </div>

    </section>

    <%-- Calendar --%>
    <section class="calendar float">


    </section>
</main>

<%--???--%>
<footer>

</footer>

</body>
</html>
