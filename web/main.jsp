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
    <%--<link rel="stylesheet" type="text/css" href="css/main.css">--%>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <%--<script type="text/javascript" src="js/main.js"></script>--%>

    <style>
        body {
            margin: 0;
            z-index: 0;
            overflow: hidden;
            font-family: 'NanumSquare', light;
        }
        /* box-size 에 padding, border 을 포함*/
        * {
            box-sizing: border-box;
        }
        /*-----------------------------------header-------------------------------------*/
        header {
            position: fixed;
            width: 100%;
            height: 44px;
            border: 1px solid #E7E7E7;
            padding: 5px 0 5px 0;
            text-align: center;
        }
        .header-logo {
            position: absolute;
            display: block;
            height: 32px;
            top: 0;
            left: calc(50% - 46px);
            padding-top: 5px;
        }
        .logo-image {
            height: 32px;
            width: 93px;
        }
        .user {
            position: absolute;
            top: 4px;
            right: 20px;
        }
        .user-box {
            display: block;
            float: left;
            height: 34px;
            padding-right: 8px;
        }
        .text {
            padding: 6px 8px 4px 0;
        }
        .user-name {
            height:34px;
        }
        .user-image {
            width:34px;
            height:34px;
        }
        /* --------------------------------sub header(search bar)------------------------------------- */

        .sub-header {
            position: fixed;
            float:left;
            top:44px;
            width: 100%;
            height: 44px;
            padding: 2px 0 2px 0;
            background-color: #ffffff;
            text-align: center;
        }
        .search-bar {
            position: absolute;
            top: 0;
            left: calc(50% - 170px);
        }
        .search-bar input[type=text] {
            width: 340px;
            height: 36px;
            margin: 4px 0 4px 0;
            background-color: #FAFAFA;
            border: 1px solid #E7E7E7;
            border-radius: 5px;
            padding: 7px;
        }
        /* --------------------------------side menu(board list)------------------------------------- */
        .side-menu {
            z-index: -1;
            height: 100%;
            width: 34%;
            /*min-width: 360px;*/
            padding: calc(88px + 5%) 0 0 11%;
        }
        .side-menu-container {
            position: fixed;
            padding:0;
            width: 360px;
            height: 100%;
            min-width: 300px;
        }
        .side-menu-container button {
            width: 182px;
            height: 36px;
            padding: 0;
            border:0;
            background-color:rgba(0,0,0,0);
            cursor:pointer;
        }
        .button-img-wrap {
            display:inline-block;
            width:35px;
            height: 35px;
            padding:10px;
            border-radius:5px;
            background-color: #EAEAEA;
        }
        .side-menu-container img {
            width: 15px;
            height: 15px;
        }
        .side-menu-container button span {
            display:inline-block;
            font-family: 'NanumSquare', Regular;
            font-size: 20px;
            margin: 0 0 0 12px;
        }
        #board-list span {
            font-family: 'NanumSquare', Regular;
            font-size: 20px;
        }
        .modal-header-name {
            display: block;
            font-family:"NanumSquare Bold";
            font-size: 30px;
            color: #707070;
        }
        .modal-close-button {
            position:absolute;
            width: 20px;
            height:20px;
            cursor:pointer;
        }
        #create-board-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }
        #create-board-modal-contents {
            position: fixed;
            top: calc(50% - 300px);
            left: calc(50% - 400px);
            width: 800px;
            height: 600px;
            border: 1px solid #707070;
            border-radius: 5px;
            padding: 10px 20px 10px 20px;
            background-color: #FFFFFF;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.24);
        }
        .create-board-modal-header span {
            margin: 20px 0 20px 34px;
        }
        .create-board-close-button {
            top: 48px;
            right: 49px;
        }
        .create-board-container-name {
            margin: 35px 0 5px 89px;
        }
        #create-board-name {
            width: 617px;
            height: 40px;
            margin: 0 0 0 89px;
            border: 0;
            border-bottom: 1px solid #E7E7E7;
            padding-left: 14px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        #create-board-modal-contents .container span {
            display: block;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #707070;
        }
        .create-board-container-bg {
            margin: 40px 0 23px 89px;
        }
        .color-button-container {
            padding: 0 100px 0 170px;
        }
        .color-button-container li {
            display:inline-block;
        }
        .board-color-button {
            display:inline-block;
            width: 50px;
            height: 50px;
            margin: 0 14px 0 0;
            border: 0;
            border-radius: 5px;
        }
        .invite-user-span {
            margin: 42px 0 19px 89px;
        }
        .invite-user-name {
            border: 1px solid #E7E7E7;
            border-radius: 5px;
            background-color: #FAFAFA;
            width: 470px;
            height: 50px;
            margin-left: 122px;
            padding-left: 15px
        }
        .invite-user-button {
            position: absolute;
            top: 417px;
            right: 108px;
            background: #ACACAC;
            width: 88px;
            height: 50px;
            border: 1px solid #E7E7E7;
            border-radius: 3px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        .create-board-button {
            position:absolute;
            background: #707070;
            width: 250px;
            height: 50px;
            bottom: 35px;
            left: calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        .d-day {
            z-index: -1;
            padding: calc(88px + 5%) 0 0 0;
            height: 100%;
            width: 32%;
            min-width: 360px;
        }
        .today {
            position: relative;
            width:600px;
            height: 320px;
            padding: 40px;
            text-align: center;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.16);
        }
        .today-shadow {
            z-index:-1;
            position:absolute;
            top:51px;
            left:calc(50% - 49px);
            width: 104px;
            height: 28px;
            background-color: #EFCE4A;
        }
        .today li {
            margin-bottom: 53px;
        }
        .today .today-header {
            font-family:"NanumSquare Regular";
            font-size: 33px;
        }
        .today .card-name {
            font-family:"NanumSquare Bold";
            font-size: 35px;
        }
        .today .today-date {
            font-family:"NanumSquare Regular";
            font-size: 25px;
        }
        .calendar {
            z-index: -1;
            height: 100%;
            width: 34%;
        }
        .float {
            float: left;
        }

        /* 브라우저 별 호환성 확인 */
        .search-bar input::placeholder  {
            color: #707070;
            font-size: 16px;
            text-align: center;
            background: url(/image/search.png) no-repeat;
            background-size: 18px 18px;
            background-position: 130px 0;
        }
        #board-list {
            margin: 0 0 30px 0;
        }
        #board-list li {
            margin: 0 0 15px 0;
        }
        ul {
            padding: 0;
            margin: 0;
        }
        li {
            list-style-type: none;
            padding: 0;

        }

        #create-board-modal-contents .container input::placeholder {
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
            background: url(/image/user_male_black_shape.png) no-repeat;
            background-size: 18px 18px;
            background-position: 0 3px;
        }
        a:link, a:visited {
            color: initial;
            text-decoration: none;
            cursor: pointer;
        }

        a:link:active, a:visited:active {
            color: initial;
        }

        @media only screen and (max-width: 600px) {
            section.side-menu {
                display: none;
            }
        }
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

            <ul>
                <li><span class="today-header">TODAY</span></li>
                <li><span class="card-name">Home UI 완성하기</span></li>
                <li><span class="today-date">Oct, 4th (THU)</span></li>
            </ul>
            <div class="today-shadow"></div>


        </div>

    </section>

    <%-- Calendar --%>
    <section class="calendar float">



    </section>
</main>

<%--???--%>
<footer>

</footer>


<script>
    $(document).ready(function() {
        var modal_board = document.getElementById('more-menu-modal');

// modal 밖 클릭시 modal 종료
        $(function () {
            window.onclick = function (event) {
                if (event.target == modal_board) {
                    alert(modal_board);
                    modal_board.style.display = "none";
                }
            };
        });

    });


</script>
</body>
</html>
