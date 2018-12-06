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
            overflow-x:scroll;
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
            font-family:
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
        .star-before {
            float: right;
            width: 16px;
            height: 16px;
        }
        .star-after {
            float: right;
            width: 16px;
            height: 16px;
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
        .add-card-modal-header span {
            margin: 10px 0 10px 34px;
        }
        .add-card-close-button{
            top: 48px;
            right: 49px;
        }
        .modal-star-off {
            position: absolute;
            width: 25px;
            height: 25px;
            top: 45px;
            right: 80px;
        }
        .add-card-container-name {
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
        .add-card-container-description {
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
        .add-card-container-duedate {
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
            height: 320px;
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
        <a href="logout.jsp" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="image/user.png" class="user-image"></a>
    </div>
</header>
<section class="sub-header">
    <span class="board-name">NanSsoGong</span>
    <img src="image/post_it_on.png" class="post-it">
    <a href ="calendar.jsp"><img  src="image/calendar_off.png" class="calendar"></a>
    <img src="image/more.png" class="more-menu" onclick="document.getElementById('more-menu-modal').style.display='block'">
    <img src="image/delete.png" class="settings-menu">
</section>
<main>
    <div id="list">
        <div id="listName1" class="list sortable">
            <div class="list-header">
                <span class="list-name">To Do</span>
                <a href="#" class="list-tool-button-box"><img src="image/more_2.png" class="list-tool-box"></a>
            </div>
            <ul class="list-contents">
                <li class="card"><span>Card1</span><img src="/image/star_off.png"  class="star-before"></li>
                <li class="card"><span>Card2</span><img src="/image/star_off.png"  class="star-before"></li>
            </ul>
            <img src="image/plus.png" class="open-add-card-modal">
        </div>

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
        <form id="add-card-modal-contents">
            <div class="add-card-modal-header">
                <span class="modal-header-name">Create a Card</span>
                <img src="image/multiply.png" class="modal-close-button add-card-close-button" onclick="document.getElementById('add-card-modal').style.display='none'">
                <img src="image/star_off.png" class="modal-star-off">
            </div>
            <hr style="width: 702px; border: 0; border-top:1px solid rgba(112, 112, 112, 0.5);">
            <div class="container">
                <span class="add-card-container-name">Card Name</span>
                <input type="text" id="add-card-name" required>
                <span class="add-card-container-description">Description</span>
                <textarea id="add-card-description" placeholder="Write a description..."></textarea>
                <span class="add-card-container-duedate">Due Date</span>
                <div id='duedate'><script type="text/javascript">Today('null','null','null');</script></div>
            </div>
            <button class="add-card-button" type="button">create</button>
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
            <button type="button" class="user-invite-ok-button">OK</button>
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
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/';
    //var myUrl = 'http://localhost:3000/api/';
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

    function loadList(response) {
        document.getElementById("list").innerHTML = list;

        // element 추가할 때 이벤트 다시 등록하기
        $(".sortable .list-contents").sortable({
            connectWith: ".sortable .list-contents"
        }).disableSelection();
        $(".sortable").draggable({ containment: "#list", scroll: false });
        $(".open-add-card-modal").on("click", function() {
            document.getElementById('add-card-modal').style.display = 'block'; // add-modal 보이기
            var div_id = $(this).closest("div").attr("id");  // 클릭한 버튼이 속한 div 선택
            sessionStorage.setItem("click_list_id", div_id);
        });
    }

    $(function() {
        $(".star-before").on("click", function () {
            var starClass = $(this).attr("class");

            if(starClass == 'star-before') {
                $(this).attr("src", "image/star_on.png");
            }
            $(this).attr("class", 'star-after');
        });
    });

    $(function() {
        $(".star-after").on("click", function () {
            var starClass = $(this).attr("class");

            if(starClass == 'star-after') {
                $(this).attr("src", "image/star_off.png");
            }
            $(this).attr("class", 'star-before');
        });
    });
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

    /*List 간 Card 이동*/
    $(function () {
        $(".sortable .list-contents").sortable({
            connectWith: ".sortable .list-contents"
        }).disableSelection();
    });
    /*List 안에서 Card 이동*/
    $(function () {
        $(".sortable").draggable({ containment: "#list", scroll: false });
    });
    /* Card 추가 */
    $(function() {
        $(".open-add-card-modal").on("click", function() {
            document.getElementById('add-card-modal').style.display='block' // add-modal 보이기
            var div_id = $(this).closest("div").attr("id");  // 클릭한 버튼이 속한 div 선택
            sessionStorage.setItem("click_list_id", div_id);
        });
    });
    /* Card 추가 */
    $(function() {
        $(".add-card-button").on("click", function() {
            // modal 에서 입력한 List 이름 가져오기
            var add_card_name = $("#add-card-name").val();
            var click_list_id = sessionStorage.getItem("click_list_id");
            var clicked_list = document.getElementById(click_list_id).children[1]; // div 의 자식노드중 두번째 (ul - .list-contents)
            $(clicked_list).append("<li class=\"card\"><span>" + add_card_name + "</span><img src=\"/image/star_off.png\" class=\"star-before\"></li>");
            // Card 생성 후 modal 종료
            var modal = document.getElementById('add-card-modal');
            modal.style.display = "none";
            //sessionStorage.clear();
        });
    });
    /* List 추가 */
    $(function() {
    $(".add-list-button").on("click", function() {
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
        // List 추가
        $("#list").append("<div id='" + add_list_name + "' class='list sortable'><div class='list-header'><span class='list-name'>" + add_list_name + "</span><a href='#' class='list-tool-button-box'><img src='image/more_2.png' class='list-tool-box'></a></div><ul class='list-contents'></ul><img src='image/plus.png' class='open-add-card-modal'></div>");
        var rect = document.getElementById(add_list_name).getBoundingClientRect();
        left = left + rect.width;
        top = top - 92;
        $("#"+ add_list_name).css({"left" : left, "top" : top});
        // List 생성 후 modal 종료
        var modal = document.getElementById('add-list-modal');
        modal.style.display = "none";
        // element 추가할 때 이벤트 다시 등록하기
        $(".sortable .list-contents").sortable({
            connectWith: ".sortable .list-contents"
        }).disableSelection();
        $(".sortable").draggable({ containment: "#list", scroll: false });
        $(".open-add-card-modal").on("click", function() {
            document.getElementById('add-card-modal').style.display = 'block' // add-modal 보이기
            var div_id = $(this).closest("div").attr("id");  // 클릭한 버튼이 속한 div 선택
            sessionStorage.setItem("click_list_id", div_id);
        });
    });
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
        alert('board_idx : ' + board_data.board_idx + ', board_name : ' + board_data.board_name + ', board_background : ' + board_data.board_background + ', board_master : ' + board_data.board_master);

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
            }
            else {
                alert('보드 정보를 불러올 수 없습니다.');
            }
        });
    }

    function addList() {
        if(!checkValidation()) { alert('유효하지 않은 보드입니다.'); return false; }

        //테스트 코드 START
        var list_name = 'test' + Date.now(); // ex) test1543991086330
        var list_position_x = 0;
        var list_position_y = 0;
        //테스트 코드 END

        var body = {
            "list_name": list_name,
            "list_position_x": list_position_x,
            "list_position_y": list_position_y
        };

        getJson('POST', myUrl.concat('list/', board_data.board_idx), body, function (status, response) {
            if(status == 201) { // 성공
                list_data.push(new List(response.list_idx, body.list_name, body.list_position_x, body.list_position_y));
                //리스트 추가 UI 구현
            }
            else {
                alert('리스트를 추가할 수 없습니다..');
            }
        });
    };

    function editList() {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        //테스트 코드 START
        var list = {
            list_idx : 16,
            list_name : 'test' + Date.now(), // ex) test1543991086330
            list_position_x : 3,
            list_position_y : 4
        };
        //테스트 코드 END

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

    function deleteList() {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        //테스트 코드 START
        var list = {
            list_idx : 17,
            list_name : 'test',
            list_position_x: 0,
            list_position_y: 0
        }
        //테스트 코드 END

        var list_idx = list.list_idx;
        var body = {
            "list_name": list.list_name
        };

        getJson('DELETE', myUrl.concat('list/', board_data.board_idx, '/', list_idx.toString()), body, function (status, response) {
            if(status == 201) { // 성공
                list_data.forEach(function (item, index, array) {
                    if(item.list_idx == list_idx) {list_data.splice(index, 1);}
                    //alert(item.list_name);
                });

                //리스트 UI 변경 함수
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

        var list_idx = 2;
        var body = {
            card_name: 'test card : ' + Date.now(),
            card_end_date: '2018-12-08',
            card_order: 1,
            card_content: "카드 내용",
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
            }
            else {
                alert('카드를 추가할 수 없습니다.');
            }
        });
    };

    function editCard(ori_list_idx, new_list_idx) {
        if(!checkValidation() || !ori_list_idx || !new_list_idx) { alert('유효하지 않은 접근입니다.'); return false; }

        var body = {
            card_idx : 22,
            card_name: 'test card : ' + Date.now(),
            card_end_date: '2018-12-06',
            card_order: 7,
            card_content: "카드 내용2",
            card_mark: 1
        };

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

    function linkBoard(user_idx) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        getJson('LINK', myUrl.concat('board/', user_idx, '/', board_data.board_idx), null, function (status, response) {
            if(status == 201) { // 성공
                alert('보드 공유를 완료했습니다.');
            }
            else {
                alert('보드를 공유할 수 없습니다.');
            }
        });
    };

    function searchUser(id) {
        if(!checkValidation()) { alert('유효하지 않은 접근입니다.'); return false; }

        var body = {
            "user_id" : id
        };

        alert('hi');
        alert(id);
        getJson('POST', myUrl.concat('user/'), body, function (status, response) {
            if(status == 201) { // 성공
                ///showUser(response.data); 함수 구현
                var str = '';
                response.data.forEach(function(item, index){
                    str += (index + 1) + ' : ' + item.user_name + '\n';
                }); // 테스트 코드
                alert(str);
            }
            else {
                alert('유저 목록을 불러올 수 없습니다.');
            }
        });
    };

    function hrefHistory() {

        sessionStorage.setItem("board_idx", board_data.board_idx);
        sessionStorage.setItem("board_name", board_data.board_name);
        sessionStorage.setItem("board_background", board_data.board_background);

        location.href = "history.jsp";
    }

</script>

</body>
</html>