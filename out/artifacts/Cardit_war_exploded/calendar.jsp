<%--
  Created by IntelliJ IDEA.
  User: shin-yeji
  Date: 15/11/2018
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" import="java.util.*" %>
<%
    // Global Vars
    int action = 0;  // 1이면 다음 달, 0이면 이전 달
    int currYear = 0; // if it is not retrieved from incoming URL (month=) then 현재 년도
    int currMonth = 0;
    String boxSize = "90";  // 달력 한 칸 크기

//build 2 calendars

    Calendar c = Calendar.getInstance();
    Calendar cal = Calendar.getInstance();

    if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
    {
        currMonth = c.get(c.MONTH);
        currYear = c.get(c.YEAR);
        cal.set(currYear, currMonth,1);
    }

    else
    {
        if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
        {
            currMonth = Integer.parseInt(request.getParameter("month"));
            currYear = Integer.parseInt(request.getParameter("year"));

            if (Integer.parseInt( request.getParameter("action")) == 1 )
            {
                cal.set(currYear, currMonth, 1);
                cal.add(cal.MONTH, 1);
                currMonth = cal.get(cal.MONTH);
                currYear = cal.get(cal.YEAR);
            }
            else
            {
                cal.set(currYear, currMonth ,1);
                cal.add(cal.MONTH, -1);
                currMonth = cal.get(cal.MONTH);
                currYear = cal.get(cal.YEAR);
            }
        }
    }
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
        .calendar-y-m{
            margin-top: 10px;
            margin-bottom: 20px;
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
            vertical-align: middle;
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
<body>

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
    <div class="search-bar">
        <input type="text" name="search" placeholder="   검색">
    </div>
</section>

<main>
    <div class="calendar">
        <table height='100' width='519' celpadding='0' cellspacing='0' align="center" valign="center">
            <tr>
                <td width='150' align='right' valign='middle'><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><img height="20px" width="20px" src="image/back.png"></a></td>
                <td width='260' align='center' valign='middle'><b><font color="#707070" size="6px"><%= cal.get(cal.YEAR)+"."+getDateName (cal.get(cal.MONTH))%></font></b></td>
                <td width='173' align='left' valign='middle'><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><img height="20px" width="20px" src="image/next.png"></a></td>
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


                        for (int w = 1; w < 6; w++)
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
                                    todayColor = "#D7D7D7";
                                }
                                else
                                {
                                    todayColor = "#ffffff";
                                }
                        %>
                        <td bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="center" height="<%=boxSize%>" valign="center"><font size="4" color="#707070"><%=dispDay%></font><br>
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
        <ul class="list-contents">
            <li class="card">
                <span><div class="d-day">D-3</div><span class="d-date">09.18</span></span>
                <span class="d-content">SOW 보고서 쓰기</span>
                <img src="image/star_off.png" class="star-img"/>
            </li>
            <li class="card">
                <span><div class="d-day">D-7</div><span class="d-date">09.28</span></span>
                <span class="d-content">프로젝트 이름 정하기</span>
                <img src="image/star_off.png" class="star-img"/>
            </li>
        </ul>
    </div>

</main>

</body>
</html>


















