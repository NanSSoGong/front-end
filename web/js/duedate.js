
function dateSelect(obj,selectIndex) {
    var docForm = obj.parentElement.parentElement.parentElement;
    var watch = new Date(docForm.year.options[docForm.year.selectedIndex].text, docForm.month.options[docForm.month.selectedIndex].value,1);
    var hourDiffer = watch - 86400000;
    var calendar = new Date(hourDiffer);

    var daysInMonth = calendar.getDate();
    for (var i = 0; i < docForm.day.length; i++) {
        docForm.day.options[0] = null;
    }
    for (var i = 0; i < daysInMonth; i++) {
        docForm.day.options[i] = new Option(i+1);
    }
    docForm.day.options[0].selected = true;
}

function Today(year,mon,day){
    if(year == "null" && mon == "null" && day == "null"){
        today = new Date();
        this_year=today.getFullYear();
        this_month=today.getMonth();
        this_month+=1;
        if(this_month <10) this_month="0" + this_month;

        this_day=today.getDate();
        if(this_day<10) this_day="0" + this_day;
    }
    else{
        var this_year = eval(year);
        var this_month = eval(mon);
        var this_day = eval(day);
    }

    var montharray=new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var maxdays = montharray[this_month-1];
//아래는 윤달을 구하는 것
    if (this_month==2) {
        if ((this_year/4)!=parseInt(this_year/4)) maxdays=28;
        else maxdays=29;
    }

    document.writeln("<select name='year' size=1 onChange='dateSelect(this,this.form.month.selectedIndex);'>");
    for(i=this_year-5;i<this_year+6;i++){//현재 년도에서 과거로 5년까지 미래로 5년까지를 표시함
        if(i==this_year) document.writeln("<OPTION value="+i+ " selected >" +i);
        else document.writeln("<OPTION value="+i+ ">" +i);
    }
    document.writeln("</select>년");


    document.writeln("<select name='month' size=1 onChange='dateSelect(this,this.selectedIndex);'>");
    for(i=1;i<=12;i++){
        if(i<10){
            if(i==this_month) document.writeln("<OPTION value=0" +i+ " selected >0"+i);
            else document.writeln("<OPTION value=0" +i+ ">0"+i);
        }
        else{
            if(i==this_month) document.writeln("<OPTION value=" +i+ " selected >" +i);
            else document.writeln("<OPTION value=" +i+ ">" +i);
        }
    }
    document.writeln(" </select>월");

    document.writeln("<select name='day' size=1>");
    for(i=1;i<=maxdays;i++){
        if(i<10){
            if(i==this_day) document.writeln("<OPTION value=0" +i+ " selected >0"+i);
            else document.writeln("<OPTION value=0" +i+ ">0"+i);
        }

        else{
            if(i==this_day) document.writeln("<OPTION value=" +i+ " selected } >"+i);
            else document.writeln("<OPTION value=" +i+ ">" +i);
        }
    }
    document.writeln("</select>일");

}
