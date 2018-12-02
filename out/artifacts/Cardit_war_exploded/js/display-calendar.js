function displayCalendar(moveMonth, curYear, curMonth, curDay) {
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
            htmlContent += "<td class='dayNow'><span class='day'>" + counter + "</span><span class='check'>'</span></td>";
        } else {
            htmlContent += "<td class='monthNow'><span class='day'>" + counter + "</span><span class='check'>'</span></td>";

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

