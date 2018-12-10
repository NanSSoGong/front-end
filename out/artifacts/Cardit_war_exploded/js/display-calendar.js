function displayCalendar(moveMonth, curYear, curMonth, curDay) {

    var user_idx = sessionStorage.getItem("user_idx");

    myUrl="http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/calender";

    //var calUrl = myUrl + "/emergency/" + user_idx + "/1";
    var calUrl = myUrl + "/emergency/" + user_idx + "/-1";    // "/user_idx/board_idx"
    var body = "";

    getJson('GET', calUrl, body, function (status, response) {
        if (status == 201) { // 성공
            loadCalendarList(response.data);
        }
        else { // 실패
            alert("D-Day 로드 실패");
        }
    });

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
/*
   <td class='dayNow' onMouseOver='this.style.background=\"#FF0000\"; this.style.color=\"#FFFFFF\"' " +
                "onMouseOut='this.style.background=\"#FFFFFF\"; this.style.color=\"#00FF00\"'>

   <td class='monthNow' onMouseOver='this.style.background=\"#FF0000\"'" +
                " onMouseOut='this.style.background=\"#FFFFFF\"'>
* */


//추가했습니다////필요합니다////
/*    var token = sessionStorage.getItem("user_token");
    var myUrl = 'http://ec2-13-125-157-233.ap-northeast-2.compute.amazonaws.com:3000/api/';
    var user_idx = sessionStorage.getItem("user_idx");
    var user_name = sessionStorage.getItem("user_name");*/

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

/*    // 메인페이지 로드
    function loadPage() {
        var calUrl = myUrl + "calender/emergency/" + user_idx + "/1";
        var body = "";

        getJson('GET', calUrl, body, function (status, response) {
            if (status == 201) { // 성공
                loadCalendarList(response.data);
            }
            else { // 실패
                alert("D-Day 로드 실패");
                alert(status);
            }
        });
    }*/




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