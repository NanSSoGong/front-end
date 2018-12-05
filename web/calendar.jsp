<%--
  Created by IntelliJ IDEA.
  User: shin-yeji
  Date: 15/11/2018
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" import="java.util.*" import="java.io.*" %>
<%
    // Global Vars
    int action = 0;  // 1이면 다음 달, 0이면 이전 달
    int currYear = 0; // if it is not retrieved from incoming URL (month=) then 현재 년도
    int currMonth = 0;
    String cardMonthDate ="";
    String boxSize = "90";  // 달력 한 칸 크기

    String cardDate = "";


//build 2 calendars

    Calendar c = Calendar.getInstance();
    Calendar cal = Calendar.getInstance();

    cardMonthDate= c.get(c.YEAR) + "-" + c.get(c.MONTH);

        currMonth = c.get(c.MONTH);
        currYear = c.get(c.YEAR);
        cal.set(currYear, currMonth,1);

%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try
        {
            c.set(y,m,d);
            Date dt = c.getTime();
        }
        catch (IllegalArgumentException e)
        {
            return false;

        }
        return true;
    }
%>
<%!
    public String getDateName (int monthNumber) // This method is used to quickly return the proper name of a month
    {
        String strReturn = "";
        switch (monthNumber)
        {
            case 0:
                strReturn = "01";
                break;
            case 1:
                strReturn = "02";
                break;
            case 2:
                strReturn = "03";
                break;
            case 3:
                strReturn = "04";
                break;
            case 4:
                strReturn = "05";
                break;
            case 5:
                strReturn = "06";
                break;
            case 6:
                strReturn = "07";
                break;
            case 7:
                strReturn = "08";
                break;
            case 8:
                strReturn = "09";
                break;
            case 9:
                strReturn = "10";
                break;
            case 10:
                strReturn = "11";
                break;
            case 11:
                strReturn = "12";
                break;
        }
        return strReturn;
    }
%>


<html>
<head>

    <title>Calendar | cardit</title>

    <%-- css 파일 --%>
    <link rel="stylesheet" type="text/css" href="css/calendar.css">
    <style>
        body {
            margin: 0px;
            z-index: 0;
            overflow: scroll;
            background-color: #FAFAFA;
            font-family: "NanumSquare", light;
            overflow-x:scroll;
            overflow-y:hidden;
        }
        .list-wrap {
            position:relative;
            float:left;
            width: 350px;
            height: 100%;
        }

        /* box-size 에 padding, border 을 포함*/
        * {
            box-sizing: border-box;
        }
        #list {
            position:fixed;
            top: 88px;
            left:0;
            height:100%;
            width:100%;
        }
        .today-date{
            opacity: 0.3;
            width: 32px;
            height: 32px;
            background-image: url("image/date_circle.png");
        }
        .calendar-y-m{
            margin-top: 10px;
            margin-bottom: 20px;
        }
        .calendar {
            position:relative;
            width: 700px;
            height: 780px;
            margin-top: 150px;
            margin-left: 100px;
            float: left;
            background-color: #ffffff;
            border-radius: 10px;
            align-content: center;
        }
        .list {
            position:relative;
            display: inline-block;
            border-radius: 10px;
            width: 700px;
            height: 780px;
            margin-top: 150px;
            margin-right: 100px;
            padding: 2px 7px 7px 7px;
            float: right;
            background-color: #F6F6F6;
        }
        .list-header {
            font-family:"NanumSquareOTF ExtraBold";
            margin: 10px;
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
        .d-day{
            align: center;
            font-family:"NanumSquare Bold";
            color: #707070;
            vertical-align: middle;
            font-size: 25px;
        }
        .d-date{
            font-family:"NanumSquare light";
            color: #707070;
            vertical-align: middle;
            font-size: 15px;
        }
        .d-content{
            font-size: 15pt;
            vertical-align: center;
            margin-left: 50px;
        }
        .list-tool-button-box {
            margin: 10px;
            position: absolute;
            top:12px;
            right:10px;
            width:24px;
            height:24px;
        }
        .star-img{
            vertical-align: middle;
            float: right;
            width: 20px;
            height: 20px;
        }
        .card {
            vertical-align: center;
            font-family:"NanumSquare Bold";
            color: #707070;
            margin: 10px;
            border-radius: 10px;
            padding: 20px;
            font-size: 16px;
            width: 660px;
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

        #add-list-modal button {
            position:absolute;
            background: #F6F6F6;
            width: 250px;
            height: 50px;
            bottom: 30px;
            left: calc(50% - 125px);
            border: 0;
            border-radius: 5px;
            color: #707070;
            cursor: pointer;
        }
        .calendar-img {
            position:absolute;
            width: 24px;
            height: 24px;
            margin: 8px 0 8px 0;
            top:0;
            left:180px;
            cursor: pointer;
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

        /* 브라우저 별 호환성 확인 */
        .search-bar::placeholder  {
            color: #707070;
            font-size: 16px;
            text-align: center;
            background: url(/image/search.png) no-repeat;
            background-size: 18px 18px;
            background-position: 130px 0;
        }
        li {
            list-style-type: none;

        }
        ul {
            padding-inline-start: 0px;
            padding: 10px 0 0 0;
        }

    </style>
    <%-- jquery 기본 파일 --%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.ui.js"></script>

    <%--<script type="text/javascript" src="js/board.js"></script>--%>
</head>
<body onload="loadCalendar()">

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
    <span class="board-name">NanSsoGong</span>
    <a href="board.jsp"><img src="image/post_it_off.png" class="post-it"></a>
    <a href ="calendar.jsp"><img src="image/calendar_on.png" class="calendar-img"></a>
    <div class="search-bar">
        <input type="text" name="search" placeholder="검색">
    </div>
    <img src="image/more.png" class="more-menu" onclick="document.getElementById('more-menu-modal').style.display='block'">
    <img src="image/settings.png" class="settings-menu">
</section>


<main>
    <div class="calendar">
        <table height='100' width='519' celpadding='0' cellspacing='0' align="center" valign="center">
            <tr>
                <td width='150' align='right' valign='middle'><a href="calendar.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><img height="20px" width="20px" src="image/back.png"></a></td>
                <td width='260' align='center' valign='middle'><b><font color="#707070" size="6px"><%= cal.get(cal.YEAR)+"."+getDateName (cal.get(cal.MONTH))%></font></b></td>
                <td width='173' align='left' valign='middle'><a href="calendar.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><img height="20px" width="20px" src="image/next.png"></a></td>
            </tr>
        </table>
        <table align="center" valign="center" border="0" width="520" style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="0" cellspacing="0">
            <td width="100%">
                <table class="calendar-y-m" border="2" width="519" style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#F02E0B"><b>Sun</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Mon</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Tue</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Wed</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Thu</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Fri</b></font></td>
                        <td width="<%=boxSize%>" align="center" nowrap >
                            <font size=4 color="#707070"><b>Sat</b></font></td>
                    </tr>
                    <%

                        //'Calendar loop
                        int currDay;
                        String todayColor;
                        int count = 1;
                        int dispDay = 1;

                        int today =0;


                        for (int w = 1; w < 7; w++)
                        {
                    %>
                    <tr>
                        <%
                            for (int d = 1; d < 8; d++)
                            {
                                if (! (count >= cal.get(c.DAY_OF_WEEK)))
                                {

                        %>
                        <td width="<%=boxSize%>" height="<%=boxSize%>" valign="top" align="left">&nbsp;</td>
                        <%
                            count += 1;
                        }
                        else
                        {

                            if (isDate ( currMonth + 1, dispDay, currYear) ) // use the isDate method
                            {

                                if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
                                {
                                    todayColor = "#ffffff";
                                    today=1;
                                }
                                else
                                {
                                    todayColor = "#ffffff";
                                }
                        %>
                        <td bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="center" align-vertical="true" height="<%=boxSize%>" valign="center">
                            <% if(today==1) {%>
                                <div class="today-date"/>
                            <% today=0; } %>
                            <div ><font size="4" color="#707070"><%=dispDay%></font></div><br>
                            <% if(cardDate.indexOf(dispDay) != -1) {%>
                            <div id="haveDate"><img height=8px weight=8px src="image/date_on.png"/></div>
                            <% } %>
                        </td>
                        <%
                            count += 1;
                            dispDay += 1;
                        }
                        else
                        {
                        %>
                        <td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>
                        <%
                                    }
                                }
                            }
                        %>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </td>
            <tr><td>
        </table>
    </div>


    <div id="DDAY" class="list sortable">
        <div class="list-header">
            <span class="list-name">D-DAY</span>
            <a href="#" class="list-tool-button-box"><img src="image/more_black.png" class="list-tool-box"></a>
        </div>
        <ul id="list-content" class="list-contents">
        </ul>
    </div>
</main>

<script>
    /*
    if (!(request.getParameter("action") == null)) // Have the calendar up or down in this if block
    {
        currMonth = Integer.parseInt(request.getParameter("month"));
        currYear = Integer.parseInt(request.getParameter("year"));

        if (Integer.parseInt( request.getParameter("action")) == 1 ) {
            cal.set(currYear, currMonth, 1);
            cal.add(cal.MONTH, 1);
            currMonth = cal.get(cal.MONTH);
            currYear = cal.get(cal.YEAR);
        } else {
            cal.set(currYear, currMonth ,1);
            cal.add(cal.MONTH, -1);
            currMonth = cal.get(cal.MONTH);
            currYear = cal.get(cal.YEAR);
        }
    }
*/

    //var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE1NDM4MTg1NzQsImV4cCI6MTU0NjQxMDU3NH0.fGAuub9Qean8dXUUEmfldjlQ4a7nxe09-buwFQzwv-w";
    var token = sessionStorage.getItem("user_token");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/calender';

    var dateList = new Array();
    var dateString ="";

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


    //캘린더 페이지 불러오기
    function loadCalendar(){
        var user_idx = sessionStorage.getItem("user_idx");
        var board_idx = sessionStorage.getItem("board_idx");

        myUrl="http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/calender";

        var calUrl = myUrl + "/emergency/" + user_idx + "/1";
        //var calUrl = myUrl + "/emergency/" + user_idx + "/" + board_idx;    // "/user_idx/board_idx"
        var body = "";

        getJson('GET', calUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadCalendarList(response.data);
                loadEmerList(response.data);
            }
            else { // 실패
                alert("D-Day 로드 실패");
            }
        });
    }

    //Calendar 정보 불러오기
    function loadCalendarList(response){
        var i;
        var end_date;

        for (i in response) {
            end_date = response[i].card_end_date.toString().substr(8,2);
            dateList[i] = end_date;
            dateString += end_date + " ";
        }


    }

    //D-DAY 카드 불러오기
    function loadEmerList(response){
            var emerList = "";
            var i;
            var end_month;
            var end_date;

            for (i in response) {
                end_month = response[i].card_end_date.toString().substr(5,2);
                end_date = response[i].card_end_date.toString().substr(8,2);

                emerList += "<li class='card'><span><span class=\"d-day\">D";

                if(response[i].d_day > 0) {
                    emerList += '-' + response[i].d_day;
                }
                else {
                    emerList += "+" + (-response[i].d_day);
                }

                emerList += "<br></span><span class=\"d-date\">&nbsp" + end_month + "." + end_date + "</span></span><span class=\"d-content\"> " + response[i].card_name + "</span>\n";

                if (response[i].card_mark == 0) {
                    emerList += "<img id=\"cardStar\" src=\"image/star_off.png\" class=\"star-img\" onclick=\"changeStar()\"/></li>";
                }
                else {
                    emerList += "<img id=\"cardStar\" src=\"image/star_on.png\" class=\"star-img\" onclick=\"changeStar()\"/></li>";
                }
            }
            document.getElementById('list-content').innerHTML = emerList;
    }

    //카드 중요도 변경하기
    function changeStar(card_name) {
        var card_mark =0;

        if(document.getElementById("cardStar").src=="http://localhost:8080/image/star_off.png") {
            document.getElementById("cardStar").src="image/star_on.png";
            card_mark=1;
        }
        else {
            document.getElementById("cardStar").src = "image/star_off.png";
            card_mark=0;
        }

        var body = {
            "card_name": card_name,
            "card_mark": card_mark
        };

        getJson('PUT', myUrl, body, function (status, response) {
            if(status == 200 || status==201) { // 성공
            }
            else { // 실패
            }
        })
    }



</script>


</body>
</html>


















