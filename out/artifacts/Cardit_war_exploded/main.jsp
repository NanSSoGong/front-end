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
    <link rel="stylesheet" type="text/css" href="css/jquery.ui.css">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/display-calendar.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

    <style>
        .calendar {
            width: 296px;
            height: 336px;
            border: 0;
            margin: 0;
            padding: 0;
        }
        .preMon {
            background: #FFFFFF;
            border: 0;
            font-size: 17px;
            margin: 0 20px 0 0;
            color: #707070;
            cursor: pointer;
        }
        .nextMon {
            background: #FFFFFF;
            border: 0;
            font-size: 17px;
            margin: 0 0 0 20px;
            color: #707070;
            cursor: pointer;
        }
        .monthPre {
            color: gray;
            text-align: center;
        }
        .monthNow {
            font-family: "NanumSquare", Regular;
            font-size: 12px;
            color: #707070;
            text-align: center;
        }
        .dayNum span {
            display:block;
        }
        .dayNames {
            text-align: center;
        }
        .dayNow {
            border: 0;
            color: #707070;
            text-align: center;
        }
        .monthNow th {
            font-family: "NanumSquare", ExtraBold;
            font-size: 17px;
            color: #707070;
        }
        .calendar td {
            font-family: "NanumSquare", Regular;
            font-size: 13px;
            color: #707070;
            width: calc(296px / 7);
        }
        .calendar td:first-child {
            color:#F02E0B;
        }
        @media screen and (max-width: 1000px) {
            .side-menu {
                display: none;
            }
            .calendar-section {
                display: none;
            }
        }


    </style>

</head>
<body onload="loadPage()">
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
        <button type="button" onclick="calDDay('july 10,2019')"></button>
    </div>
</section>

<main>
    <%-- side menu --%>
    <section class="side-menu float">
        <div class="side-menu-container">
            <ul id="board-list">
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
            <ul id="d-day-wrapper">
                <%----%>
            </ul>
        </div>

    </section>

    <%-- Calendar --%>
    <section class="calendar-section float">
        <div id="calendar-wrapper">

        </div>



    </section>
</main>

<%--???--%>
<footer>

</footer>
<%--

<li><div class='card-list'><div class='card-header'><span class='board-name'>NanSSoGong</span><span class='colon'>: </span><span class='list-name'>To Do</span><span class='d-day-number'>D-2</span></div><div class='card-contents'><span class='card-name'>SOW 보고서 쓰기</span><span class='card-duedate'>Due Date : Oct, 6th</span></div><button class='done-button'>Done</button><button class='hide-button'>Hide</button></div></li>
--%>

<script>
    var token = sessionStorage.getItem("user_token");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/';

    var getJson = function(method, url, body, callback) {
        var xhr = new XMLHttpRequest();

        xhr.open(method, url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('authorization', token);
        xhr.responseType = 'json';
        xhr.onload = function() {
            callback(xhr.status, xhr.response);
        };
        if(data) {
            var data = JSON.stringify(body);
            xhr.send(data);
        }
        else xhr.send();
    };

    // 메인페이지 로드
    function loadPage() {
        var boardUrl = myUrl + "board/1"; /*"/board/:user_idx"*/
        var cardUrl = "json_test/card.json";/*myUrl + "card/:1";*/    /*"/card/:board_idx"*/
        var calendarUrl = "json_test/card.json";/*myUrl + "calendar";*/
        var body = "";
        var user_name = sessionStorage.getItem("user_name")


        getJson('GET', boardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadBoardList(response.data);
            }
            else { // 실패
                alert("board 로드 실패");
            }
        })
        getJson('GET', cardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadCardList(response.data);
            }
            else { // 실패
                alert("카드 로드 실패");
            }
        })
        getJson('GET', calendarUrl, body, function (status, response) {
            if (status == 201) { // 성공
                displayCalendar(0);
                //loadCalendar(response.data);
            }
            else { // 실패
                alert("캘린더 로드 실패");
            }
        })

        document.getElementsByClassName('user_name').innerText = user_name;
    }

    function loadBoardList(response) {
        var boardList = "";
        var i;

        for (i in response) {
            boardList += "<li class='board-li'><a href='board.jsp'><span>- " + response[i].board_name + "</span></a></li>";
        }

        document.getElementById('board-list').innerHTML = boardList;
    }

    function loadCardList(response) {
        var cardList = "";
        var i;
/*
        var todayCard = "<div class='today-shadow'></div><ul><li><span class='today-header'>TODAY</span></li><li><span class='today-card-name'>" +
            response[0].card_name + "</span></li><li><span class='today-date'>Oct, 4th (THU)</span></li></ul>";
*/
        for (i=0; i < response.length; i++) {
            cardList += "<li><div class='card-list'><div class='card-header'><span class='board-name'>" +
                response[i].card_name + "</span><span class='colon'>: </span><span class='list-name'>" +
                response[i].list_name + "</span><span class='d-day-number'>D-2</span></div><div class='card-contents'><span class='card-name'>" +
                response[i].card_content + "</span><span class='card-duedate'>Due Date : Oct, 6th</span></div><button class='done-button'>Done</button><button class='hide-button'>Hide</button></div></li>"
        }

        document.getElementById('d-day-wrapper').innerHTML = cardList;
    }

    /*function loadCalendar(response) {
        var dayNum = document.getElementById("calendar-wrapper").querySelectorAll('tr');
        var i, date, month, year, endDay;
        for(i = 2; i<dayNum.length;i++) {
            date = new Date(response[i].card_end_date);
            year = date.getFullYear();
            month = date.getMonth();
            endDay = date.getDay();

            if(response.
        }

    }*/

    function calDDay(endDate) {
        var now = new Date();
        var then = new Date(endDate);
        var gap = then.getTime() - now.getTime();
        var d_day = "D" + Math.floor(gap / (1000 * 60 * 60 * 24));

        alert(d_day);
    }
</script>

</body>
</html>
