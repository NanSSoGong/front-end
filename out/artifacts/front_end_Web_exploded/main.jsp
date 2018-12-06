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

        .color-button-container input {
            display: none;
            cursor: pointer;
        }
        .color-button-container label {
            display: inline-block;
            position: relative;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .checkmark {
            display: inline-block;
            width: 50px;
            height: 50px;
            margin: 0 0 0 0;
            border: 0;
            border-radius: 5px;
        }
        /* On mouse-over, add a grey background color */
        .color-button-container input:hover ~ .checkmark {
            background-color: #ccc;
        }
        /* When the radio button is checked, add a blue background */
        .color-button-container input:checked + .checkmark {
            background-color: #2196F3;
        }
        /* Create the indicator (the dot/circle - hidden when not checked) */
        .color-button-container:after {
            content: "";
            position: absolute;
            display: none;
        }
        /* Show the indicator (dot/circle) when checked */
        .color-button-container input:checked ~ .checkmark:after {
            position: absolute;
            display: block;
            width: 50px;
            height: 50px;
            background-color: rgba(0,0,0, 0.3);
            content:"";
        }
        /* Style the indicator (dot/circle) */
        .color-button-container .checkmark:after {
            border-radius: 5px;
            background: white;
        }


        .board-a {
            cursor: pointer;
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
            <form id="create-board-modal-contents" name="createBoardForm">
                <div class="create-board-modal-header">
                    <span class="modal-header-name">Create a Board</span>
                    <img src="image/multiply.png" class="modal-close-button create-board-close-button" onclick="document.getElementById('create-board-modal').style.display='none'">
                </div>
                <hr style="width: 700px; border: 0; border-top:1px solid #707070;">
                <div class="container">
                    <span class="create-board-container-name container-span">Board Name</span>
                    <input id="create-board-name" name="boardName" type="text">
                    <span class="create-board-container-bg container-span">Background</span>
                    <ul class="color-button-container">
                        <li><label><input class="board-color-button" type="radio" title="blue" name="boardColor" value="0"><span class="checkmark" style="background-color:#3178BA;"></span></label></li>
                        <li><label><input class="board-color-button" type="radio" title="orange" name="boardColor" value="1"><span class="checkmark" style="background-color:#C99247;"></span></label></li>
                        <li><label><input class="board-color-button" type="radio" title="green" name="boardColor" value="2"><span class="checkmark" style="background-color:#639646;"></span></label></li>
                        <li><label><input class="board-color-button" type="radio" title="red" name="boardColor" value="3"><span class="checkmark" style="background-color:#A44C39;"></span></label></li>
                        <li><label><input class="board-color-button" type="radio" title="purple" name="boardColor" value="4"><span class="checkmark" style="background-color:#83639A;"></span></label></li>
                        <li><label><input class="board-color-button" type="radio" title="pink" name="boardColor" value="5"><span class="checkmark" style="background-color:#BF628F;"></span></label></li>
                    </ul>
                    <span class="invite-user-span container-span">Invite members</span>
                    <div class="invite-user"><input type="text" class="invite-user-name" placeholder="       search by user ID" id="invite-user-input"></div>
                    <button type="button" class="invite-user-button" onclick="inviteUser()">invite</button>
                </div>
                <button type="button" onclick="createBoard()" class="create-board-button">OK</button>
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
    //추가했습니다////필요합니다////
    var token = sessionStorage.getItem("user_token");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/';
    var user_idx = sessionStorage.getItem("user_idx");
    var user_name = sessionStorage.getItem("user_name");
	
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
        if(data) {
            var data = JSON.stringify(body);
            xhr.send(data);
        }
        else xhr.send();
    };

    // 메인페이지 로드
    function loadPage() {


        var boardUrl = myUrl + "board/1"; /*"/board/:user_idx"*/
        var cardUrl = myUrl + "/calender/emergency/"+ user_idx +"/-1";  /*"/card/:board_idx"*/
        var calendarUrl = "json_test/card.json";/*myUrl + "calendar";*/
        var body = "";




        getJson('GET', boardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadBoardList(response.data);
            }
            else { // 실패
                alert("board 로드 실패");
            }
        });
        getJson('GET', cardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadCardList(response.data);
                displayCalendar(0);
            }
            else { // 실패
                alert("카드 로드 실패");
            }
        });
/*        getJson('GET', calendarUrl, body, function (status, response) {
            if (status == 201) { // 성공
                displayCalendar(0);
                //loadCalendar(response.data);
            }
            else { // 실패
                alert("캘린더 로드 실패");
            }
        });*/

        document.getElementsByClassName('user_name').innerText = user_name;

    }



    function loadBoardList(response) {
        var boardList = "";
        var i;

        for (i in response) {
            boardList += "<li class='board-li'><a class='board-a'><span>-</span><span>" + response[i].board_name + "</span><span id='board-idx' style='display:none;'>" + response[i].board_idx + "</span><span id='board-color' style='display: none'>" + response[i].background + "</span></a></li>";
        }

        document.getElementById('board-list').innerHTML = boardList;
        $(function() {
            $(".board-a").on("click", function() {
                var b = $(this).children();
                var board_name = b[1].innerText;
                var board_idx = b[2].innerText;
                var board_color = b[3].innerText;

                sessionStorage.setItem("now_board_name", board_name);
                sessionStorage.setItem("now_board_idx", board_idx);
                sessionStorage.setItem("now_board_color", board_color);

                location.replace("board.jsp");
            });
        });
    }

    function loadCardList(response) {
        var cardList = "";
        var i;
/*
        var todayCard = "<div class='today-shadow'></div><ul><li><span class='today-header'>TODAY</span></li><li><span class='today-card-name'>" +
            response[0].card_name + "</span></li><li><span class='today-date'>Oct, 4th (THU)</span></li></ul>";
*/
        for (i=0; i < response.length; i++) {
            cardList += "<li><div class='card-list'><div class='card-header'><span class='board-name'><b>" +
                response[i].card_name + "</b></span><span class='colon'>: </span><span class='list-name'>" +
                response[i].list_name + "</span><span class='d-day-number'>D-2</span></div><div class='card-contents'><span class='card-name'>" +
                /*response[i].card_content + */"</span><span class='card-duedate'>Due Date : Oct, 6th</span></div></div></li>"
        }

        //document.getElementById('today').innerHTML = todayCard;
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

    function createBoard() {
        var f = document.createBoardForm;
        var boardName = f.boardName.value;
        var boardColor = f.boardColor.value;
        var createBoardUrl = myUrl + "board/" + user_idx;
        alert(boardName);
        var body={
			"board_name" : boardName,
			"board_background" : boardColor
        };
        getJson('POST', createBoardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                $("#board-list").append("<li class='board-li'><a href='board.jsp' class='board-a'><span>-</span><span>" + boardName + "</span><span id='board-idx' style='display:none;'>" + "9999" + "</span><span id='board-color' style='display: none'>" + boardColor + "</span></a></li>");

                //클릭했을 때 idx와 name 저장 이벤트 재등록
                $(function() {
                    $(".board-a").on("click", function() {
                        var b = $(this).children();
                        var board_name = b[1].innerText;
                        var board_idx = b[2].innerText;
                        var board_color = b[3].innerText;

                        sessionStorage.setItem("now_board_name", board_name);
                        sessionStorage.setItem("now_board_idx", board_idx);
                        sessionStorage.setItem("now_board_color", board_color);

                        location.replace("board.jsp");
                    });
                });
            }
            else { // 실패
                alert("board 로드 실패");

            }
        });

        document.getElementById('create-board-modal').style.display = "none";
    }

    function calDDay(endDate) {
        var now = new Date();
        var then = new Date(endDate);
        var gap = then.getTime() - now.getTime();
        var d_day = "D" + Math.floor(gap / (1000 * 60 * 60 * 24));

        alert(d_day);
    }

    function inviteUser(){
        var user_id = document.getElementById('invite-user-input').innerText;
        alert(user_id);
        var inviteUserUrl = myUrl + "user/";
        var body={
            "user_id" : user_id
        }
        getJson('POST',inviteUserUrl,body,function (status, response) {
            if(status == 201){
                alert(response.data);
            }else{
                alert("user 로드 실패");
            }
        })
    }
</script>

</body>
</html>
