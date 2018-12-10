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
    <%--<link rel="stylesheet" type="text/css" href="css/board.css">--%>
    <style>
        body {
            margin: 0;
            z-index: 0;
            background-color: #FAFAFA;
            font-family: "NanumSquare", light;
            overflow-x:auto;
            overflow-y:hidden;
            /**/
        }
        .list-wrap {
            float: left;
            position:relative;
            display: inline-block;
            float:left;
            width: auto;
            height: 100%;
        }

        /* box-size 에 padding, border 을 포함*/
        * {
            box-sizing: border-box;
        }
        #list {
            position:relative;
            top: 88px;
            left:0;
            height:100%;
            width:100%;


        }
        .list {
            position:absolute;
            display: inline-block;
            border: 1px solid #eee;
            border-radius: 5px;
            width: 350px;
            min-height: 20px;
            margin: 5px;
            padding: 2px 7px 7px 7px;
            float: left;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.24);
            background-color: #F6F6F6;
        }
        .list-header {
            font-family:"NanumSquare ExtraBold";
            font-size: 22px;
            color: #707070;
            height: 50px;
            width: 334px;
        }
        .list-header img {
            width:24px;
            height:24px;
        }
        .list-name {
            display: inline-block;
            margin: 10px 0 0 5px;
        }
        .list-tool-button-box {
            position: absolute;
            top:12px;
            right:10px;
            width:24px;
            height:24px;
        }
        .list-contents {
            overflow-x: hidden;
            overflow-y: auto;
            max-height: calc(100% - 140px);
        }
        .card {
            font-family:"NanumSquare Bold";
            color: #707070;
            margin: 0 0 10px 0;
            border-radius: 5px;
            padding: 10px 14px 14px 14px;
            font-size: 16px;
            width: 334px;
            height: 86px;
            background-color: #FFFFFF;
        }
        .open-add-card-modal {
            display: block;
            cursor: pointer;
            margin: 0px calc(50% - 16px) 10px calc(50% - 16px);
        }
        .cardStar {
            float: right;
            width: 16px;
            height: 16px;
            cursor:pointer;
        }
        /*-----------------------------------header-------------------------------------*/
        header {
            position: fixed;
            top: 0;
            width: 100%;
            height: 44px;
            border: 1px solid #E7E7E7;
            padding: 5px 0 5px 0;
            background-color: #ffffff;
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
        .home-box {
            position: absolute;
            top: 0;
            left: 20px;
            float: left;
            height: 24px;
            width: 24px;
            margin: 10px 0 10px 0;
        }
        .home-button {
            width: 24px;
            height: 24px;
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
        /*.image {
        }*/
        .user-name {
            height:34px;
        }
        .user-image {
            width:34px;
            height:34px;
        }
        /*        .float {
                    float: left;
                }*/

        /*-----------------------sub-header-------------------------*/
        .sub-header {
            position: fixed;
            top: 44px;
            width: 100%;
            height: 44px;
            /*border: 1px solid #E7E7E7;*/
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
        .more-menu {
            position:absolute;
            width: 24px;
            height: 24px;
            margin: 8px 0 8px 0;
            top:0;
            right:60px;
            cursor: pointer;
        }
        .settings-menu {
            position:absolute;
            width: 24px;
            height: 24px;
            margin: 8px 0 8px 0;
            top:0;
            right:20px;
            cursor: pointer;
        }
        .board-name {
            position:absolute;
            top:4px;
            left:24px;
            height:24px;
            width:auto;
            margin: 8px 0 8px 0;
        }
        .post-it {
            position:absolute;
            width: 24px;
            height: 24px;
            margin: 8px 0 8px 0;
            top:0;
            left:150px;
            cursor: pointer;
        }
        .calendar {
            position:absolute;
            width: 24px;
            height: 24px;
            margin: 8px 0 8px 0;
            top:0;
            left:180px;
            cursor: pointer;
        }


        /*----------------------- footer -------------------------*/
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

        .open-add-list-modal {
            position:fixed;
            background: #F6F6F6;
            bottom: 40px;
            left: calc(50% - 200px);
            width: 400px;
            border: 0px;
            border-radius: 5px;
            box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.16);
            padding: 18px 0 17px 0;
            color: #FFFFFF;
            cursor: pointer;
        }
        #add-list-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }
        #add-list-modal-contents {
            position: fixed;
            top: calc(50% - 160px);
            left: calc(50% - 245px);
            width: 490px;
            height: 320px;
            border: 0;
            border-radius: 5px;
            padding: 20px 20px 20px 20px;
            background-color: #FFFFFF;
        }


        .add-list-modal-header span {
            margin: 0 0 15px 22px;
        }

        .add-list-modal-header img {
            top: 38px;
            right: 48px;
        }
        #add-list-modal-contents .container span {
            display: block;
            margin: 35px 0 10px 37px;
            font-family:"NanumSquare Regular";
            font-size: 25px;
            color: #707070;
        }
        #add-list-name {
            width: 352px;
            height: 45px;
            margin: 0 37px 0 37px;
            border: 0;
            border-bottom: 1px solid #E7E7E7;
            padding: 0 0 0 14px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
            /*focus:on;*/
        }

        #add-list-modal button {
            position:absolute;
            background: #707070;
            width: 250px;
            height: 50px;
            bottom: 34px;
            left: calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        #add-card-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }
        #add-card-modal-contents {
            position: fixed;
            top: calc(50% - 300px);
            left: calc(50% - 400px);
            width: 800px;
            height: 600px;
            border: 0;
            border-radius: 5px;
            padding: 20px 20px 20px 20px;
            background-color: #FFFFFF;
        }
        .card-modal-header span {
            margin: 10px 0 10px 34px;
        }
        .card-close-button{
            top: 48px;
            right: 49px;
        }
        .modal-cardStar {
            position: absolute;
            width: 25px;
            height: 25px;
            top: 45px;
            right: 80px;
        }
        .card-container-name {
            margin: 32px 0 0 68px;
        }
        #add-card-name {
            width: 617px;
            height: 40px;
            margin: 0 0 0 68px;
            border: 0;
            border-bottom: 1px solid #E7E7E7;
            padding-left: 14px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        #add-card-modal-contents .container span {
            display: inline-block;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #707070;
        }
        .card-container-description {
            margin: 36px 0 10px 68px;
        }
        #add-card-description {
            resize: none;
            width: 615px;
            height: 100px;
            margin: 0 98px 0 68px;
            padding: 14px 18px 14px 18px;
            border: 1px solid #E7E7E7;
            background-color: #FAFAFA;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        .card-container-duedate {
            margin: 40px 0 0 68px;
        }
        #duedate {
            display: inline-block;
            margin: 40px 0 0 344px;
        }
        #add-card-modal button {
            position:absolute;
            background: #707070;
            width: 250px;
            height: 50px;
            bottom: 60px;
            left: calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        #edit-card-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }
        #edit-card-modal-contents {
            position: fixed;
            top: calc(50% - 300px);
            left: calc(50% - 400px);
            width: 800px;
            height: 600px;
            border: 0;
            border-radius: 5px;
            padding: 20px 20px 20px 20px;
            background-color: #FFFFFF;
        }
        #edit-card-name {
            width: 617px;
            height: 40px;
            margin: 0 0 0 68px;
            border: 0;
            border-bottom: 1px solid #E7E7E7;
            padding-left: 14px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        #edit-card-modal-contents .container span {
            display: inline-block;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #707070;
        }
        #edit-card-description {
            resize: none;
            width: 615px;
            height: 100px;
            margin: 0 98px 0 68px;
            padding: 14px 18px 14px 18px;
            border: 1px solid #E7E7E7;
            background-color: #FAFAFA;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        #edit-duedate {
            display: inline-block;
            margin: 40px 0 0 344px;
        }
        #edit-card-modal button {
            position:absolute;
            background: #707070;
            width: 250px;
            height: 50px;
            bottom: 60px;
            left: calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        #more-menu-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.0);
        }
        #more-menu-modal-contents {
            position: fixed;
            top: 85px;
            right: 10px;
            width: 350px;
            height: 210px;
            border: 0;
            border-radius: 5px;
            padding: 10px 20px 10px 20px;
            background-color: #FFFFFF;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.24);
        }
        .more-menu-header span {
            display: inline-block;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #707070;
            margin: 14px 0 10px 10px;
        }
        #more-menu-modal-contents .container a {
            display: block;
            margin: 13px 100px 24px 15px;
            cursor: pointer;
        }
        #more-menu-modal-contents .container img {
            display: inline-block;
            width: 20px;
            height: 20px;
            margin: 12px 0 0 14px;
        }
        #more-menu-modal-contents .container span {
            position: absolute;
            display: inline-block;
            margin-bottom: 10px;
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #707070;
        }
        .invite-users-span {
            top: 92px;
            left: 104px;
        }
        .see-history-span {
            top: 158px;
            left: 104px;
        }
        .more-menu-close-button {
            position:absolute;
            cursor:pointer;
            width: 16px;
            height: 16px;
            top: 30px;
            right: 29px;
        }
        #user-invite-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }
        #user-invite-modal-contents {
            position: fixed;
            top: calc(50% - 160px);
            left: calc(50% - 365px);
            width: 730px;
            height: auto;
            min-height: 320px;
            border: 0;
            border-radius: 5px;
            padding: 10px 20px 10px 20px;
            background-color: #FFFFFF;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.24);
        }
        .user-invite-close-button {
            top: 48px;
            right: 54px;
        }
        .user-invite-header span {
            margin: 18px 0 20px 37px;
        }
        #user-invite-modal-contents .container {
            display: block;
            width: 630px;
            height: 50px;
            margin: 48px 0 0 37px;
        }
        .invite-user-name {
            border: 1px solid #E7E7E7;
            border-radius: 5px;
            background-color: #FAFAFA;
            width: 536px;
            height: 50px;
            padding-left: 15px
        }
        .user-invite-button {
            position: absolute;
            top: 137px;
            right: 69px;
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
        .user-invite-ok-button {
            background: #707070;
            width: 250px;
            height: 50px;
            margin: 0 0 10px calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            font-size: 20px;
            color: #FFFFFF;
            cursor: pointer;
        }
        #user-list {
            display:block;
            width: 632px;
            height: auto;
            margin:10px 0 0 37px;
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
        textarea::placeholder {
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
        }
        #user-invite-modal-contents .container input::placeholder {
            font-family:"NanumSquare Regular";
            font-size: 20px;
            color: #B5B5B5;
            background: url(/image/user_male_black_shape.png) no-repeat;
            background-size: 18px 18px;
            background-position: 0 3px;
        }
        li {
            list-style-type: none;

        }
        ul {
            padding-inline-start: 0px;
            padding: 10px 0 0 0;
        }
        input[type=text]:focus {
            outline: none;
        }
        textarea:focus {
            outline: none;
        }

    </style>
    <%-- jquery 기본 파일 --%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.ui.js"></script>

    <script type="text/javascript" src="js/duedate.js"></script>
    <script type="text/javascript" src="js/board.js"></script>
</head>

<body>
<%-- top menu --%>
<header>
    <a href="main.jsp" class="home-box image"><img src="image/home.png" class="home-button"></a>
    <a href="main.jsp" class="header-logo"><img src="image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" onclick="logout()" class="user-box text"><span id="user-name" class="user-name"></span></a>
        <a href="#" onclick="logout()" class="user-box image"><img src="image/user.png" class="user-image"></a>
    </div>
</header>
<section class="sub-header">
    <span class="board-name">NanSsoGong</span>
    <img src="image/post_it_on.png" class="post-it">
    <a href ="calendar.jsp"><img  src="image/calendar_off.png" class="calendar"></a>
    <img src="image/more.png" class="more-menu" onclick="document.getElementById('more-menu-modal').style.display='block'">
    <img src="image/delete.png" class="settings-menu" onclick="deleteBoard();">
</section>
<main>
    <div id="list">
        <%-- List UI --%>
    </div>
</main>


<footer>
    <div id="add-list">
        <button class="open-add-list-modal" onclick="document.getElementById('add-list-modal').style.display='block'"><img src="image/plus.png"></button>
        <div id="add-list-modal">
            <form id="add-list-modal-contents">
                <div class="add-list-modal-header">
                    <span class="modal-header-name">Create a List</span>
                    <img src="image/multiply.png" class="modal-close-button" onclick="document.getElementById('add-list-modal').style.display='none'">
                </div>
                <hr style="width: 402px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
                <div class="container">
                    <span>List Name</span>
                    <input type="text" id="add-list-name" required>
                </div>
                <button class="add-list-button" type="button">create</button>
            </form>
        </div>
    </div>
    <div id="add-card-modal">
        <form id="add-card-modal-contents" name="addCardForm">
            <div class="card-modal-header">
                <span class="modal-header-name">Create a Card</span>
                <img src="image/multiply.png" class="modal-close-button card-close-button" onclick="document.getElementById('add-card-modal').style.display='none'">
                <img src="image/star_off.png" class="modal-cardStar" id="cardStar" alt="off">
            </div>
            <hr style="width: 702px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
            <div class="container">
                <span class="card-container-name">Card Name</span>
                <input type="text" id="add-card-name" required>
                <span class="card-container-description">Description</span>
                <textarea id="add-card-description" placeholder="Write a description..."></textarea>
                <span class="card-container-duedate">Due Date</span>
                <div id='duedate'>
                    <script type="text/javascript">Today('null','null','null');</script>
                </div>
            </div>
            <button class="add-card-button" type="button" onclick='addCard()'>create</button>
        </form>
    </div>
    <%----%>
    <div id="edit-card-modal">
        <form id="edit-card-modal-contents" name="editCardForm">
            <div class="card-modal-header">
                <span class="modal-header-name">Edit a Card</span>
                <img src="image/multiply.png" class="modal-close-button card-close-button" onclick="document.getElementById('edit-card-modal').style.display='none'">
                <img src="image/star_off.png" class="modal-cardStar">
            </div>
            <hr style="width: 702px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
            <div class="container">
                <span class="card-container-name">Card Name</span>
                <input type="text" id="edit-card-name" name="editCardName"required>
                <span class="card-container-description">Description</span>
                <textarea id="edit-card-description" name="editCardContent" placeholder="Write a description..."></textarea>
                <span class="card-container-duedate">Due Date</span>
                <div id='edit-duedate'><script type="text/javascript">Today('null','null','null');</script></div>
            </div>
            <button class="edit-card-button" type="button" onclick='editCard()'>create</button>
        </form>
    </div>
    <div id="more-menu-modal">
        <form id="more-menu-modal-contents">
            <div class="more-menu-header">
                <span>more</span>
                <img src="image/multiply.png" class="modal-close-button more-menu-close-button" onclick="document.getElementById('more-menu-modal').style.display='none'">
            </div>
            <hr style="width: 302px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
            <div class="container">
                <a onclick="document.getElementById('user-invite-modal').style.display='block'">
                    <img src="image/add_contacts.png" class="invite-users-img">
                    <span class="invite-users-span">invite users..</span>
                </a>
                <hr style="width: 302px; border: 0; border-top: 1px solid #E7E7E7;">
                <a onclick="hrefHistory()">
                    <img src="image/time_passing.png" class="see-history-img">
                    <span class="see-history-span">see history..</span>
                </a>
            </div>
        </form>
    </div>
    <div id="user-invite-modal">
        <form id="user-invite-modal-contents">
            <div class="user-invite-header">
                <span class="modal-header-name">Invite members</span>
                <img src="image/multiply.png" class="modal-close-button user-invite-close-button" onclick="document.getElementById('user-invite-modal').style.display='none'">
            </div>
            <hr style="width: 632px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
            <div class="container">
                <input type="text" class="invite-user-name" name="invite-user-text" placeholder="      search by user ID">
                <button type="button" class="user-invite-button" id="invite-user-button">invite</button>
            </div>
            <ul id="user-list"></ul>
            <button type="button" class="user-invite-ok-button" id = "send-invite-user" onclick="linkBoard()">OK</button>
        </form>
    </div>


    <%-- list 양식
        <div id="listName" class="list sortable">
            <div class="list-header">
                <span class="list-name">To Do</span>
                <a href="#" class="list-tool-button-box"><img src="image/baseline-more_horiz-24px.svg" class="list-tool-box"></a>
            </div>
            <ul class="list-contents">
                <li class="card">Card1</li>
                <li class="card">Card2</li>
            </ul>
            <img src="image/plus.png" class="open-add-card-modal" onclick="document.getElementById('add-card-modal').style.display='block'">
        </div>

        <div id="listName1" class="list sortable">
                <div class="list-header">
                    <span class="list-name">To Do</span>
                    <a href="#" class="list-tool-button-box"><img src="image/more_2.png" class="list-tool-box"></a>
                </div>
                <ul class="list-contents">
                    <li class="card"><span>Card1</span><img src="/image/star_off.png" class="star-before"></li>
                    <li class="card"><span>Card2</span><img src="/image/star_off.png" class="star-before"></li>
                </ul>
                <img src="image/plus.png" class="open-add-card-modal">
            </div>
        --%>
</footer>

<script>
    var token = sessionStorage.getItem("user_token");
    var user_name = sessionStorage.getItem("user_name");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/';

    var board_data = {
        board_idx : -1,
        board_name : '',
        board_background : '',
        board_master : 0
    };
    var list_data = [];

    $(document).ready(function() {
        if(!token) location.replace("index.jsp");
        loadData();
        setBackgroundColor(board_data.board_background);
        setUserName();
    });

    var getJson = function(method, url, body, callback) {

        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('authorization', token);
        xhr.responseType = 'json';
        xhr.onload = function() {  callback(xhr.status, xhr.response); };

        if(body) {
            var data = JSON.stringify(body);
            xhr.send(data);
        }
        else {
            xhr.send();
        }

    };

    /* 유저 이름 설정 */
    function setUserName() {
        document.getElementById('user-name').innerText = user_name;
    }

    function setBackgroundColor(color) {
        var bg = document.getElementById("list");
        if ( color=="0") bg.style.backgroundColor = "#3178BA";
        else if ( color=="1") bg.style.backgroundColor = "#C99247";
        else if ( color=="2") bg.style.backgroundColor = "#639646";
        else if ( color=="3") bg.style.backgroundColor = "#A44C39";
        else if ( color=="4") bg.style.backgroundColor = "#83639A";
        else if ( color=="5") bg.style.backgroundColor = "#BF628F";
        else bg.style.backgroundColor = "#FFFFFF";
    }

    // 유저 검색 기능
    $(function() {
        $('input[name="invite-user-text"]').keyup(function (e) {
            if (e.keyCode == 13) {
                searchUser($('input[name="invite-user-text"]').val());
            }
        });
    });
    $(function() {
        $("#invite-user-button").on("click", function () {
            searchUser($('input[name="invite-user-text"]').val());
        });
    });
    /*카드를 클릭했을 때 수정화면 보이기*/
    $(document).on("click",".card-name", function() {
        document.getElementById('edit-card-modal').style.display = 'block'; // add-modal 보이기
        var card_id = $(this).parent().attr("id");  // 클릭한 버튼이 속한 div 선택
        var selectCard = card_id.split('-');
        var list_idx = selectCard[0], card_idx = selectCard[1];
        var f = document.editCardForm;
        sessionStorage.setItem("selectList_idx", list_idx);
        sessionStorage.setItem("selectCard_idx", card_idx);

        list_data.some(function (list) {
            if (list.list_idx == list_idx) {
                list.card.some(function (card) {
                    if (card.card_idx == card_idx) {
                        var end_date = card.card_end_date.split('-');
                        var day = end_date[2].split('T');
                        f.editCardName.value = card.card_name;
                        f.editCardContent.value = card.card_content;
                        f.year.value = end_date[0];
                        f.month.value = end_date[1];
                        f.day.value = day[0];
                    }
                });
            }
        });
    });
    /*카드 추가 화면 보이기*/
    $(document).on("click",".open-add-card-modal", function() {
        document.getElementById('add-card-modal').style.display='block'; // add-modal 보이기
        var div_id = $(this).closest("div").attr("id");  // 클릭한 버튼이 속한 div 선택
        sessionStorage.setItem("click_list_id", div_id);
    });
    /*카드 이동가능*/
    $(document).on("mousedown", ".sortable .list-contents", function() {
        $(".sortable .list-contents").sortable({
            connectWith: ".sortable .list-contents"
        }).disableSelection();
    });
    /*리스트 이동 가능*/
    $(document).on("mouseover", ".sortable", function() {
        $(".sortable").draggable({ containment: "#list", scroll: false });
    });
    /*리스트 클릭 할 때 제일 앞으로*/
    $(document).on("mousedown", ".list", function() {
        $('.list').css("z-index", 0);
        $(this).css("z-index", 2);
    });
    /*리스트를 드랍했을 때 원래대로, 리스트 이동했을 때 위치 저장, 리스트 최대 크기 제한*/
    $(document).on("mouseup", ".list", function() {
        $('.list').css("z-index", 0);
        $(this).css("z-index", 1);

        editList(this);
    });
    /*드래그 할 때 리스트의 최대 높이 제한*/
    $(document).on("drag",".list", function() {
        var maxHeight = window.innerHeight;
        var curPositionY = this.getBoundingClientRect().top;
        var availableHeight = maxHeight - curPositionY - 10;

        $(this).css("max-height",availableHeight);
        $(this).children('ul').css("max-height", availableHeight-140);
    });
    /* List 추가 */
    $(document).on("click",".add-list-button", function() {
        // modal 에서 입력한 List 이름 가져오기
        var add_list_name = $("#add-list-name").val();
        var list = document.getElementById('list');
        var i;
        var top = 0; var left = 0;
        for (i = 0; i < list.childElementCount; i++) {
            var list_position = document.getElementById(list.children[i].getAttribute("id")).getBoundingClientRect();
            if( list_position.left > left) {
                left = list_position.left;
                top = list_position.top;
            }
        }
        if(list.childElementCount!=0 ) {
            left = left + 360;
            top = top - 92;
        }
        addList(left, top, add_list_name);

        // List 생성 후 modal 종료
        var modal = document.getElementById('add-list-modal');
        modal.style.display = "none";

        //setEvent();
        document.getElementById('add-list-modal-contents').reset();
    });
    /*수정 버튼 눌렀을 때*/
    $(document).on("click", ".edit-card-button", function() {
        var ori_list_idx = sessionStorage.getItem("selectList_idx");
        var card_idx = sessionStorage.getItem("selectCard_idx");

        if(ori_list_idx != null) {
            //editCard(ori_list_idx, ori_list_idx, card_idx);
        }
        document.getElementById('edit-card-modal-contents').reset();
        document.getElementById('edit-card-modal').style.display='none'
    });
    /*카드가 리스트 사이를 이동 할 때 카드의 소속 리스트 수정*/
    $(document).on("mouseup",".card", function() {
        var card_id = $(this).attr('id');
        var selectCard = card_id.split('-');
        var list_idx = selectCard[0], card_idx = selectCard[1];

        var new_list_idx = $(".ui-sortable-placeholder").parent().parent().attr('id');
        if(new_list_idx != null) {
            editCard(list_idx, new_list_idx, card_idx);
        }
    });
    /*중요도 표시*/
    $(document).on("click", ".cardStar", function() {
        var curAlt = $(this).attr('alt');

        if(curAlt == 'off') {
            $(this).attr('src', '/image/star_on.png');
            $(this).attr('alt', 'on');
            $(this).parent().css("border", "2px solid yellow")
        }
        else {
            $(this).attr('src', '/image/star_off.png');
            $(this).attr('alt', 'off');
            $(this).parent().css("border", "0")
        }
    });

    function List(list_idx, list_name, list_position_x, list_position_y) {
        return {
            list_idx : list_idx,
            list_name : list_name,
            list_position_x : list_position_x,
            list_position_y : list_position_y,
            card : []
        };
    }

    function Card(card_idx, card_name, card_content, card_mark, card_end_date, card_order, list_idx) {
        return {
            list_idx : list_idx,
            card_idx : card_idx,
            card_name : card_name,
            card_content : card_content,
            card_mark : card_mark,
            card_end_date : card_end_date,
            card_order : card_order
        };
    }

    function checkValidation(){
        return board_data.board_idx != -1;
    }

    function loadData() {
        board_data.board_idx = sessionStorage.getItem("board_idx");
        board_data.board_name = sessionStorage.getItem("board_name");
        board_data.board_background = sessionStorage.getItem("board_background");
        board_data.board_master = sessionStorage.getItem("board_master");
        //alert('board_idx : ' + board_data.board_idx + ', board_name : ' + board_data.board_name + ', board_background : ' + board_data.board_background + ', board_master : ' + board_data.board_master);

        getListAndCard();
    };

    function getListAndCard() {
        if(!checkValidation()) { alert('유효하지 않은 보드입니다.\n보드 정보를 불러올 수 없습니다.'); return false; }

        getJson('GET', myUrl.concat('card/', board_data.board_idx), null, function (status, response) {
            if(status == 201) { // 성공
                var oldListIdx = -1;
                var crrList = null;

                response.data.forEach(function (item, index, array) {
                    if (oldListIdx != item.list_idx) {
                        if (crrList != null) list_data.push(crrList);
                        crrList = new List(item.list_idx, item.list_name, item.list_position_x, item.list_position_y);
                        oldListIdx = item.list_idx;
                    }
                    var card = new Card(item.card_idx, item.card_name, item.card_content, item.card_mark, item.card_end_date, item.card_order, item.list_idx);
                    crrList.card.push(card);
                });
                if (crrList != null) list_data.push(crrList);

                loadListHtml();
            }
            else {
                alert('보드 정보를 불러올 수 없습니다.');
            }
        });
    }
    // 페이지 로드할 때 넣을 List와 Card html
    function loadListHtml() {
        var str = '';
        list_data.forEach(function (list, index, array) {
            str += "<div id='"+ list.list_idx.toString() +"'class='list sortable' style='top: "+ list.list_position_y +"px; left:" +
                list.list_position_x + "px;'><span  style='display:none;'></span><div class='list-header'><span class='list-name'>" +
                list.list_name + "</span><a onclick='deleteList(" + list.list_idx.toString() + ", \"" + list.list_name + "\")' class='list-tool-button-box'><img height='5px' width='5px' src='image/multiply.png' class='list-tool-box'></a></div>" +
                "<ul class='list-contents'>";
            // 카드를 order 순으로 정렬
            list.card.sort(function(a, b){
                return a.card_order - b.card_order;
            });
            list.card.forEach(function (card, index, array) {
                if(card.card_idx != null) {
                    if(card.card_mark == 0) {
                        str += "<li id='" + list.list_idx.toString() + "-" + card.card_idx + "' class='card' alt='off'><span class='card_idx' style='display: none;'>" + card.card_idx +
                            "</span><span class='card-name'>" + card.card_name +
                            "</span><img src='/image/star_off.png' class='cardStar' alt='off'></li>";
                    }
                    else {
                        str += "<li id='" + list.list_idx.toString() + "-" + card.card_idx + "' class='card' alt='on'><span class='card_idx' style='display: none;'>" + card.card_idx +
                            "</span><span class='card-name'>" + card.card_name +
                            "</span style=><img src='/image/star_on.png' class='cardStar' alt='on'></li>";
                    }
                }
            });
            /*onclick='changeStar(\""+ card.card_name +"\", "+ card.card_idx +")'*/
            str += "</ul><img src='image/plus.png' class='open-add-card-modal'></div>";
        });
        document.getElementById('list').innerHTML = str;

        var cardStar = $(".cardStar");
        if(cardStar.attr('alt') == 'on') {
            cardStar.parent().css("border", "2px solid yellow");
        }
    }

    function addList(list_position_x, list_position_y, list_name) {
        if(!checkValidation()) { alert('유효하지 않은 보드입니다.'); return false; }

        var body = {
            "list_name": list_name,
            "list_position_x": list_position_x,
            "list_position_y": list_position_y
        };

        getJson('POST', myUrl.concat('list/', board_data.board_idx), body, function (status, response) {
            if(status == 201) { // 성공
                list_data.push(new List(response.list_idx, body.list_name, body.list_position_x, body.list_position_y));

                //리스트 추가 UI 구현
                $("#list").append("<div id='"+ response.list_idx +"'class='list sortable' style='top: "+ body.list_position_y +"px; left:" +
                    body.list_position_x + "px;'><span  style='display:none;'></span><div class='list-header'><span class='list-name'>" +
                    body.list_name + "</span><a onclick='deleteList(" + response.list_idx + ", \"" + body.list_name + "\")' class='list-tool-button-box'><img height='5px' width='5px' src='image/multiply.png' class='list-tool-box'></a></div>" +
                    "<ul class='list-contents'></ul><img src='image/plus.png' class='open-add-card-modal'></div>");
            }
            else {
                alert('리스트를 추가할 수 없습니다..');
            }
        });
        sessionStorage.removeItem("click_list_id");
    };

    function editList(obj) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        var list_idx = $(obj).attr('id')
        var list = {
            list_idx : list_idx,
            list_name : obj.children[1].children[0].innerText, // ex) test1543991086330
            list_position_x : document.getElementById(list_idx).style.left,
            list_position_y : document.getElementById(list_idx).style.top
        };

        var body = {
            "list_name": list.list_name,
            "list_position_x": list.list_position_x,
            "list_position_y": list.list_position_y
        };
        getJson('PUT', myUrl.concat('list/', board_data.board_idx, '/', list.list_idx), body, function (status, response) {
            if(status == 201) { // 성공
                /*list_data.forEach(function (item, index, array) { //조회 테스트
                    alert(item.list_name);
                });*/

                list_data.some(function (item) {
                    if(item.list_idx == list.list_idx)
                    {
                        item.list_name = list.list_name;
                        item.list_position_x = list.list_position_x;
                        item.list_position_y = list.list_position_y;
                        return true;
                    }
                });

                //리스트 UI 변경 함수
            }
            else {
                alert('리스트를 수정할 수 없습니다.');
            }
        });
    };

    function deleteList(list_idx, list_name) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }
        /*
                //테스트 코드 START
                var list = {
                    list_idx : 17,
                    list_name : 'test',
                    list_position_x: 0,
                    list_position_y: 0
                }
                //테스트 코드 END


                var list_idx = list.list_idx;  */
        var body = {
            "list_name": list_name
        };

        getJson('DELETE', myUrl.concat('list/', board_data.board_idx, '/', list_idx.toString()), body, function (status, response) {
            if(status == 201) { // 성공
                list_data.forEach(function (item, index, array) {
                    if(item.list_idx == list_idx) {list_data.splice(index, 1);}
                    //alert(item.list_name);
                });

                //리스트 UI 변경 함수
                document.getElementById('list').removeChild(document.getElementById(list_idx));
            }
            else if(status == 500) {
                alert('이미 삭제된 리스트입니다.');
            }
            else {
                alert('리스트를 삭제할 수 없습니다.');
            }
        });
    };

    function addCard() {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }
        var card_name = $("#add-card-name").val();
        var card_content = $('#add-card-description').val();
        var list_idx = sessionStorage.getItem("click_list_id");
        var clicked_list = document.getElementById(list_idx).children[2]; // div 의 자식노드중 세번째 (ul - .list-contents)
        var f = document.forms['addCardForm'];
        var card_end_date = f['year'].value + "-" + f['month'].value + "-" + f['day'].value;
        var card_order = clicked_list.children.length + 1;

        //var list_idx = 2;
        var body = {
            card_name: card_name,
            card_end_date: card_end_date,
            card_order: card_order,
            card_content: card_content,
            card_mark: 1
        };

        getJson('POST', myUrl.concat('card/', board_data.board_idx, '/', list_idx.toString()), body, function (status, response) {
            if(status == 201) { // 성공

                list_data.some(function (item) {
                    if(item.list_idx == list_idx)
                    {
                        var card = new Card(response.card_idx, body.card_name, body.card_content, body.card_mark, body.card_end_date, body.card_order, body.list_idx);
                        item.card.push(card);
                        return true;
                    }
                });
                //카드 추가 UI 구현
                $(clicked_list).append("<li id='"+ list_idx.toString() +"-"+ response.card_idx +"' class='card'><span class='card_idx' style='display: none;'>" + response.card_idx +
                    "</span><span class='card-name'>" + card_name +
                    "</span><img src='/image/star_off.png' class='cardStar'></li>");
            }
            else {
                alert('카드를 추가할 수 없습니다.');
            }
        });
        // Card 생성 후 modal 종료
        var modal = document.getElementById('add-card-modal');
        modal.style.display = "none";
    }

    function editCard(ori_list_idx, new_list_idx, card_idx) {
        if(!checkValidation() || !ori_list_idx || !new_list_idx) { alert('유효하지 않은 접근입니다.'); return false; }

        var i;
        var select_list = document.getElementById(new_list_idx).children[2];
        var order_class, card_order = 1;
        var orderCard = select_list.children.length + 1;
        for(i=0; i< select_list.children.length; i++ ) {
            order_class = document.getElementById(new_list_idx).children[2].children[i].getAttribute('class');
            if(order_class == 'ui-sortable-placeholder card ui-sortable-handle') {
                card_order = i+1; break;
            }
            else {
                //card_order =
            }
        }

        var body = {
            new_list_idx : new_list_idx,
            card_idx : card_idx,
            card_name: '',
            card_end_date: '2018-12-06',
            card_order: card_order,
            card_content: "카드 내용",
            card_mark: 1
        };

        list_data.some(function (list) {
            if (list.list_idx == ori_list_idx) {
                list.card.some(function (card) {
                    if (card.card_idx == card_idx) {
                        var end_date = card.card_end_date.split('T');
                        body.card_name = card.card_name;
                        body.card_end_date = end_date[0];
                        body.card_content = card.card_content;
                        body.card_mark = card.card_mark;
                    }
                    else if(ori_list_idx == new_list_idx) {
                        body.card_order = card.card_order;
                    }
                    else {
                        body.card_order = card_order;
                    }
                });
            }
        });
//alert(body.list_idx+ " "+body.card_name+" "+body.card_end_date+" "+body.card_content +" "+ body.card_mark+" "+body.card_order);
        getJson('PUT', myUrl.concat('card/', board_data.board_idx, '/', ori_list_idx.toString(), '/', body.card_idx), body, function (status, response) {
                if(status == 201) { // 성공
                var card = null;
                list_data.some(function (list) {
                    if(list.list_idx == ori_list_idx)
                    {
                        if (list.card.some(function (item) {
                            if(item.card_idx == body.card_idx) {
                                item.list_idx = new_list_idx;
                                item.card_idx = body.card_idx;
                                item.card_name = body.card_name;
                                item.card_content = body.card_content;
                                item.card_end_date = body.card_end_date;
                                item.card_mark = body.card_idx;
                                item.card_order = body.card_order;
                                if (ori_list_idx != new_list_idx) {
                                    card = item;
                                }
                                return true;
                            }
                        })) return true;
                    }
                });
                if(card){
                    list_data.some(function (list) {
                        if(list.list_idx == new_list_idx)
                        {
                            list.card.push(card);
                            return true;
                        }
                    });
                }


                //카드 수정 UI 구현
            }
            else {
                alert('카드 정보를 수정할 수 없습니다.');
            }
        });
    };

    function deleteCard(list_idx, card_idx, card_name) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        var body = {
            card_idx : card_idx,
            card_name: card_name
        };

        getJson('DELETE', myUrl.concat('card/', board_data.board_idx, '/', body.card_idx), body, function (status, response) {
            if(status == 201) { // 성공

                list_data.some(function (list) {
                    if(list.list_idx == list_idx)
                    {
                        list.card.forEach(function (item, index, array) {
                            if(item.card_idx == card_idx) {list.splice(index, 1);}
                        });
                        return true;
                    }
                });
                //카드 삭제 UI 구현
            }
            else {
                alert('카드를 삭제할 수 없습니다.');
            }
        });
    };

    function deleteBoard() {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        var body = {
            board_idx : board_data.board_idx,
            board_name : board_data.board_name,
            board_master : board_data.board_master
        }

        getJson('DELETE', myUrl.concat('board/', sessionStorage.getItem("user_idx"), '/', body.board_idx, '/', body.board_master), body, function (status, response) {
            if(status == 201) { // 성공
                if(token) location.replace("main.jsp");
                else location.replace("index.jsp");
            }
            else {
                alert('보드를 삭제할 수 없습니다.');
            }
        });
    };

    var userBackGroundArray = new Array(15);

    function searchUser(id) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }
        var body = {
            "user_id" : id
        };
        var userList="";

        getJson('POST', myUrl.concat('user/', board_data.board_idx), body, function (status, response) {
            if(status == 201) { // 성공
                ///showUser(response.data); 함수 구현
                var str = '';
                response.data.forEach(function(item, index){
                    str = (index + 1) + ')  ' + item.user_name;
                    var userindex = item.user_idx;
                    userList +="<div class = '' type=\"button\" name=\"user-invite-list\" style=\"background-color: white\"  onclick=\"changeBackground(this)\" id=\""+ userindex + "\"><font color=\"#707070\" size=\"3px\">"+str + "</font></div><br>";
                    userBackGroundArray[userindex] = 0;
                });
                document.getElementById('user-list').innerHTML = userList;
            }
            else {
                alert('유저 목록을 불러올 수 없습니다.');
            }
        });
    };

    function changeBackground(obj){
        if(obj.style.backgroundColor == "white" ){
            obj.style.backgroundColor = "#e1e1e1";
            userBackGroundArray[obj.id] = 1;
        }else{
            obj.style.backgroundColor = "white";
            userBackGroundArray[obj.id] = 0;
        }
    }

    function linkBoard() {
        var userStr = "[";
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }
        for(var i = 0;i<15;i++){
            if(userBackGroundArray[i] == 1)
                userStr+=i+',';
        }
        userStr = userStr.substring(0,userStr.length-1);
        userStr +="]";
        alert(userStr);
        var body = {
            "user_idx" : userStr
        };
        getJson('PUT', myUrl.concat('user/share/', board_data.board_idx), body, function (status, response) {
            if(status == 201) { // 성공
                alert("성공입니다");
            }
            else {
                alert('보드를 공유할 수 없습니다.');
            };
        });
    };

    function hrefHistory() {
        sessionStorage.setItem("board_idx", board_data.board_idx);
        sessionStorage.setItem("board_name", board_data.board_name);
        sessionStorage.setItem("board_background", board_data.board_background);
        alert(sessionStorage.getItem("board_idx"));
        location.href = "history.jsp";
    }

    function closeModal(obj) {
        obj.parentElement.parentElement.parentElement.style.display = 'none'; // modal창 최상위 div
        obj.parentElement.parentElement.reset(); // form reset
    }

    function logout(){
        var r = confirm("로그아웃 하시겠습니까?");
        if (r == true) {
            sessionStorage.clear();
            location.replace("index.jsp");
        }
    }
</script>

</body>
</html>