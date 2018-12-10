<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %><%--
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
    <%--<script type="text/javascript" src="js/display-calendar.js"></script>--%>
    <script type="text/javascript" src="js/main.js"></script>

    <style>
        .card-list {
            position: relative;
            width:600px;
            height: 250px;
            padding: 30px 50px 0 50px;
            margin:0 0 30px 0;
            background-color: #FAFAFA;
            opacity: 0.82;
            border:0;
            border-radius: 5px;
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
            margin-bottom: 50px;
        }
        .d-day-list {
            position: absolute;
            top: 530px;
            left: calc(50% - 300px);
            width:600px;
            height: 100%;
            padding: 0;
            margin:0;
        }
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

        #calendar {
            position: fixed;
            width: 380px;
            height: 380px;
            float: left;
            align-content: center;

            right:calc(88px + 5%);
            border:0;
            border-radius: 5px;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.16);
            background-color: #FFFFFF;
        }

        #calendar-wrapper {
            position: fixed;
            right:calc(88px + 5%);
            width: 380px;
            height: 380px;
            padding: 22px 42px 22px 42px;
            border:0;
            border-radius: 5px;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.16);
            background-color: #FFFFFF;
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
<body>
<%-- top menu --%>
<header>
    <a href="main.jsp" class="header-logo"><img src="image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" onclick="logout()" class="user-box text"><span id="user-name" class="user-name"></span></a>
        <a href="#" onclick="logout()" class="user-box image"><img src="image/user.png" class="user-image"></a>
    </div>
</header>


<%-- search bar --%>
<section>

</section>

<main>
    <%-- side menu --%>
    <section class="side-menu float">
        <div class="side-menu-container">
            <ul id="board-list">
                <%-- board list --%>
            </ul>
            <button type="button" style="vertical-align:middle" onclick="document.getElementById('create-board-modal').style.display='block'"><div class="button-img-wrap"><img src="image/add.png"></div><span>Create a board</span></button>
        </div>
        <%--  create a board button 클릭 할 때 나오는 화면--%>
        <div id="create-board-modal" style = "z-index:60;">
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
                </div>
                <button type="button" onclick="createBoard()" class="create-board-button">OK</button>
            </form>
        </div>
    </section>

    <%-- D-Day --%>
    <section class="d-day float">
        <div id="today" class="today">
            <%-- D-0 --%>
        </div>
        <div class="d-day-list">
            <ul id="d-day-wrapper">
                <%-- D-1 ~ D-9999 --%>
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
    //var myUrl = 'http://localhost:3000/api/';
    var user_idx = sessionStorage.getItem("user_idx");
    var user_name = sessionStorage.getItem("user_name");
    var dateToday = "";
    var dayOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var monthName = ["Jan", "Fab", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    $(document).ready(function() {
        if(!token) location.replace("index.jsp");
        document.createBoardForm.boardColor.value = 0;
        loadPage();
        setUserName();
        setToday();
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
        if(body) {
            var data = JSON.stringify(body);
            xhr.send(data);
        }
        else xhr.send();
    };

    /* 유저 이름 설정 */
    function setUserName() {
        document.getElementById('user-name').innerText = user_name;
    }

    /* 오늘의 날짜 */
    function setToday() {
        var now = new Date();
        var today = String(now).split(' ');
        dateToday = today[1] + ", " + dayCount(today[2]) + " (" + today[0] +")";
    }

    /* d-day style 적용하기 */
    function setDdayStyle(d_day) {
        if(d_day >= 0 && d_day <= 3) return ("<span class='d-day-number' style='color:#F02E0B;'>D" + d_day + "</span>");
        else return ("<span class='d-day-number' style='color:#4F61F0;'>D" + d_day + "</span>");
    }

    function dayCount(day) {
        if(day == 1) return day += "st";
        else if(day == 2) return day += "nd";
        else if(day == 3) return day += "rd";
        else return day += "th";
    }

    // 메인페이지 로드
    function loadPage() {
        loadBoardList();
        loadCardList();

        /*        getJson('GET', calendarUrl, body, function (status, response) {
                    if (status == 201) { // 성공
                        displayCalendar(0);
                        //loadCalendar(response.data);
                    }
                    else { // 실패
                        alert("캘린더 로드 실패");
                    }
                });*/
    }

    /* 보드 리스트 불러오기 */
    function loadBoardList() {
        var boardUrl = myUrl + "/board/" + user_idx;
        var i, boardList = "", body = "";

        /* Board 목록 가져오기 */
        getJson('GET', boardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                for (i in response.data) {
                    boardList += "<li class='board-li'><a class='board-a'><span>-</span><span>" + response.data[i].board_name +
                        "</span><span id='board-idx' style='display:none;'>" + response.data[i].board_idx +
                        "</span><span id='board-color' style='display: none;'>" + response.data[i].board_background +
                        "</span><span id='board-master' style='display: none;'>" + response.data[i].board_master + "</span></a></li>";
                }

                document.getElementById('board-list').innerHTML = boardList;
            }
            else { // 실패
                alert("보드를 불러올 수 없습니다.");
            }
        });
    }

    /* 카드 불러와서 d-day 출력 */
    function loadCardList() {
        var cardUrl = myUrl + "/calender/emergency/"+ user_idx +"/-1";  /*"/card/:board_idx"*/
        var cardList = "", body = "", i, count=0;
        var todayCard = "<div class='today-shadow'></div><ul><li><span class='today-header'>TODAY</span></li><li>";

        /* 캘린더 가져오기 */
        getJson('GET', cardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                // 카드를 D_day 순으로 정렬
                response.data.sort(function(a, b){
                    return a.d_day - b.d_day;
                });

                for (i in response.data) {
                    var end_date = response.data[i].card_end_date.split('-');
                    var todayMonthName = monthName[Number(end_date[1] - 1)];
                    var day = end_date[2].split('T');
                    var todayOfWeek = dayCount(day[0]);
                    var card_d_day = response.data[i].d_day;

                    // 마감일이 오늘인 카드들
                    if(card_d_day == 0) {
                        todayCard += "<span class='today-card-name'>" + response.data[i].card_name + "<br></span>";
                        count++;
                    }
                    // 마감일이 하루 이상 남은 카드들
                    cardList += "<li><div class='card-list'><div class='card-header'><span class='board-name'><b>" +
                        response.data[i].board_name + "</b></span><span class='colon'>: </span><span class='list-name'>" +
                        response.data[i].list_name + "</span>" + setDdayStyle(card_d_day) + "</div><div class='card-contents'><span class='card-name'>" +
                        response.data[i].card_name + "</span><span class='card-duedate'>Due Date : " + todayMonthName + ", " + todayOfWeek + "</span></div></div></li>"
                }

                // Today 일정이 없을 경우
                if (count == 0) {
                    todayCard += "<span class='today-card-name'>Today is Free</span>";
                }
                else {
                    $(".d-day-list").css("top", (507 + count * 23).toString() + "px");
                }

                todayCard += "</li><li style='margin:0;'><span class='today-date'>"+ dateToday +"</span></li></ul>";

                displayCalendar(0);

                document.getElementById('today').innerHTML = todayCard;
                document.getElementById('d-day-wrapper').innerHTML = cardList;
            }
            else { // 실패
                alert("카드를 불러올 수 없습니다.");
            }
        });
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

    /* 보드 만들기 */
    function createBoard() {
        var f = document.createBoardForm;
        var boardName = f.boardName.value;
        var boardColor = f.boardColor.value;
        var createBoardUrl = myUrl + "board/" + user_idx;

        var body={
            "board_name" : boardName,
            "board_background" : boardColor
        };

        getJson('POST', createBoardUrl, body, function (status, response) {
            if (status == 201) { // 성공
                $("#board-list").append("<li class='board-li'><a class='board-a'><span>-</span><span>" + boardName +
                    "</span><span id='board-idx' style='display:none;'>" + response.board_idx +
                    "</span><span id='board-color' style='display: none;'>" + boardColor +
                    "</span><span id='board-master' style='display: none;'>" + 1 + "</span></a></li>");
            }
            else if (status == 400) { // 중복된 보드
                alert("이미 존재하는 보드입니다.");
            }
            else { // 실패
                alert("보드를 생성할 수 없습니다.");
            }

            f.boardName.value = "";
            f.boardColor.value = 0;
        });

        document.getElementById('create-board-modal').style.display = "none";
    }

    //클릭했을 때 idx와 name 저장 이벤트 재등록
    $(document).on("click",".board-a", function() {

        var b = $(this).children();
        var board_name = b[1].innerText;
        var board_idx = b[2].innerText;
        var board_background = b[3].innerText;
        var board_master = b[4].innerText;

        sessionStorage.setItem("board_name", board_name);
        sessionStorage.setItem("board_idx", board_idx);
        sessionStorage.setItem("board_background", board_background);
        sessionStorage.setItem("board_master", board_master);

        location.href = "board.jsp";
    });

    function logout(){
        var r = confirm("로그아웃 하시겠습니까?");
        if (r == true) {
            sessionStorage.clear();
            location.href = "index.jsp";
        }
    }

    <%-- display-calendar --%>
    function displayCalendar(moveMonth, curYear, curMonth, curDay) {

        //alert("ddi");

        //loadPage();
        var htmlContent = "";
        var FebNumberOfDays = "";
        var counter = 1;

        var dateNow;
        if(curYear != null && curMonth != null) {
            dateNow = new Date(curYear, curMonth);
        }
        else {
            dateNow = new Date();
        }
        var year = dateNow.getFullYear();
        var month = dateNow.getMonth() + moveMonth;
        var day = dateNow.getDate();

        // 년도 넘어갈 때
        if(month == 12) {
            month = 0;
            year += 1;
        }
        else if(month <= -1) {
            month = 11;
            year -= 1;
        }

        var nextMonth = month + 1; // getMonth()는 0~11

        // 윤달 구하기
        if (month == 1) {
            if ((year % 100 != 0) && (year % 4 == 0) || (year % 400 == 0)) {
                FebNumberOfDays = 29;
            } else {
                FebNumberOfDays = 28;

            }
        }

        // names of months and week days.
        var monthNames = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
        var dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var dayPerMonth = ["31", "" + FebNumberOfDays + "", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"]


        // days in previous month and next one , and day of week.
        var nextDate = new Date(nextMonth + ' 1 ,' + year);
        var weekdays = nextDate.getDay();
        var weekdays2 = weekdays
        var numOfDays = dayPerMonth[month];

        // this leave a white space for days of pervious month.
        while (weekdays > 0) {
            htmlContent += "<td class='monthPre'></td>";

            // used in next loop.
            weekdays--;
        }

        // loop to build the calander body.
        while (counter <= numOfDays) {


            // When to start new line.
            if (weekdays2 > 6) {
                weekdays2 = 0;
                htmlContent += "</tr><tr class='dayNum'>";
            }

            // if counter is current day.
            // highlight current day using the CSS defined in header.
            if (counter == day) {
                htmlContent += "<td class='dayNow'><span class='day'>" + counter + "</span>";
                if (dateString.indexOf(day) != -1) {
                    htmlContent += "<span id=\"haveDate\"><img height=8px weight=8px src=\"image/date_on.png\"</span></td>";
                }
                else{
                    htmlContent += "</td>";
                }
            } else {
                htmlContent += "<td class='monthNow'><span class='day'>" + counter + "</span>";
                if (dateString.indexOf(day) != -1) {
                    htmlContent += "<span id=\"haveDate\"><img height=8px weight=8px src=\"image/date_on.png\"></span></td>";
                }
                else{
                    htmlContent += "</td>";
                }
            }

            weekdays2++;
            counter++;
        }

        // building the calendar html body.
        var calendarBody = "<table class='calendar'> <tr class='monthNow'>" +
            "<th colspan='7'><button type='button' class='preMon' onclick='moveCalendar(-1)'><</button><span id='year'>" + year +
            "</span>" + "." + "<span id='month'>" + monthNames[month] + "</span>" + "</span><button type='button' class='nextMon' onclick='moveCalendar(1)'>></button></th></tr>";
        calendarBody += "<tr class='dayNames'>  <td>Sun</td>  <td>Mon</td> <td>Tue</td>" +
            "<td>Wed</td> <td>Thu</td> <td>Fri</td> <td>Sat</td> </tr>";
        calendarBody += "<tr class='dayNum'>";
        calendarBody += htmlContent;
        calendarBody += "</tr></table>";
        // set the content of div.
        document.getElementById("calendar-wrapper").innerHTML = calendarBody;
    }

    function moveCalendar(moveMonth) {
        //alert("Yong");
        var year = parseInt(document.getElementById('year').innerText);
        var month = parseInt(document.getElementById('month').innerText) - 1;
        var day = parseInt(document.getElementsByClassName('dayNow').innerText) ;

        displayCalendar(moveMonth, year, month, day);
    }

    var dateList = new Array();
    var dateString ="";

    //Calendar 정보 불러오기
    function loadCalendarList(response){
        var i;
        var end_date;

        for (i in response) {
            end_date = response[i].card_end_date.toString().substr(8, 2);
            dateList[i] = end_date;
            dateString += end_date + " ";
        }
    }

</script>

</body>
</html>