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
        .list {
            position:relative;
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
            font-family:"NanumSquareOTF ExtraBold";
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
            background-color: rgb(0,0,0);
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
        #add-card-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.7);
        }
        #add-card-modal-contents {
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
        #more-menu-modal {
            display: none;
            position:fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.0);
        }
        #more-menu-modal-contents {
            position: fixed;
            top: 85px;
            right: 10px;
            width: 350px;
            height: 230px;
            border: 0;
            border-radius: 5px;
            padding: 10px 20px 10px 20px;
            background-color: #FFFFFF;
            box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.1), 1px 1px 10px 0 rgba(0, 0, 0, 0.24);
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
    <span class="board-name">NanSsoGong</span>
    <img src="image/post_it_on.png" class="post-it">
    <img src="image/calendar_on.png" class="calendar">
    <div class="search-bar">
        <input type="text" name="search" placeholder="   검색">
    </div>
    <img src="image/more.png" class="more-menu" onclick="document.getElementById('more-menu-modal').style.display='block'">
    <img src="image/settings.png" class="settings-menu">
</section>
<main>
    <div id="list">
        <%--<div class="list-wrap">--%>
        <div id="listName1" class="list sortable">
            <div class="list-header">
                <span class="list-name">To Do</span>
                <a href="#" class="list-tool-button-box"><img src="image/more_2.png" class="list-tool-box"></a>
            </div>
            <ul class="list-contents">
                <li class="card">SOW 보고서 쓰기</li>
                <li class="card">프로젝트 이름 정하기</li>
            </ul>
            <img src="image/plus.png" class="open-add-card-modal" onclick="document.getElementById('add-card-modal').style.display='block'">
        </div>
        <%--</div>--%>
        <div id="listName2" class="list sortable">
            <div class="list-header">
                <span class="list-name">Doing</span>
                <a href="#" class="list-tool-button-box"><img src="image/more_2.png" class="list-tool-box"></a>
            </div>
            <ul class="list-contents">
                <li class="card">UI 디자인 완성하기</li>
            </ul>
            <img src="image/plus.png" class="open-add-card-modal" onclick="document.getElementById('add-card-modal').style.display='block'">
        </div>
    </div>
</main>
<footer>
    <div id="add-list">
        <%--<button class="test" style="position: absolute; top: 500px; left:500px;">test</button>--%>
        <button class="open-add-list-modal" onclick="document.getElementById('add-list-modal').style.display='block'"><img src="image/plus.png"></button>
        <div id="add-list-modal">
            <form id="add-list-modal-contents">
                <span>Create a List</span>
                <div class="container">
                    <input type="text" placeholder="List Name" id="add-list-name" required>
                    <button class="add-list-button">create</button>
                </div>
            </form>
        </div>
    </div>
    <div id="add-card">
        <%--<button class="test" style="position: absolute; top: 500px; left:500px;">test</button>--%>
        <button class="open-add-card-modal" onclick="document.getElementById('add-card-modal').style.display='block'"><img src="image/plus.png"></button>
        <div id="add-card-modal">
            <form id="add-card-modal-contents">
                <span>Create a Card</span>
                <div class="container">
                    <input type="text" placeholder="List Name" id="add-card-name" required>
                    <input type="textarea" id="add-card-textarea">

                    <button class="add-card-button">create</button>
                </div>
            </form>
        </div>
    </div>
    <div id="more-menu">
        <%--<button class="test" style="position: absolute; top: 500px; left:500px;">test</button>--%>
        <button class="more-menu-modal" onclick="document.getElementById('more-menu-modal').style.display='block'"><img src="image/plus.png"></button>
        <div id="more-menu-modal">
            <form id="more-menu-modal-contents">
                <div class="more-menu-header">
                    <span>more</span>
                    <img src="image/multiply.png" onclick="document.getElementById('more-menu-modal').style.display='none'" style="position:absolute; width: 16px; height:16px; right: 10px; cursor:pointer;">
                </div>
                <div>
                    <a href="#"><span>invite users..</span></a>
                    <a href="#"><span>see history..</span></a>
                </div>
            </form>
        </div>
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
    --%>
</footer>



<script>
    $(document).ready(function() {
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
        /*$(function() {
            $(".add-card-button").on("click", function() {
                // 클릭한 버튼이 속한 div 의 id 얻기
                var div_id = document.getElementById($(this).closest("div").attr("id"));
                // div 의 list(.list-contents)
                var new_card = div_id.children[1];
                //alert(new_card);
                $(new_card).append("<li class=\"card\"><span>Item</span><img src=\"/image/star_off.png\" class=\"star-before\"></li>");
            });
        });*/

        /* List 추가 */
        $(function() {
            $(".add-list-button").on("click", function() {
                // modal 에서 입력한 List 이름 가져오기
                var add_list_name = $("#add-list-name").val();
                //alert(add_list_name);
                // List 추가
                $("#list").append("<div id='" + add_list_name + "' class='list sortable'><div class='list-header'><span class='list-name'>" + add_list_name + "</span><a href='#' class='list-tool-button-box'><img src='image/more_2.png' class='list-tool-box'></a></div><ul class='list-contents'></ul><img src=\"image/plus.png\" class=\"open-add-card-modal\" onclick=\"document.getElementById('add-card-modal').style.display='block'\"></div>");

                // List 생성 후 modal 종료
                var modal = document.getElementById('add-list-modal');
                modal.style.display = "none";
                //alert(add_list_name);
            });
        });

        /* Card 추가 */
        $(function() {
            $(".add-card-button").on("click", function() {
                // modal 에서 입력한 List 이름 가져오기
                var add_card_name = $("#add-card-name").val();
                // 클릭한 버튼이 속한 div 의 id 얻기
                //var div_id = document.getElementById($(this).closest("div").attr("id"));
                // div 의 list(.list-contents)
                //var new_card = div_id.children[1];

                //$(new_card).append("<li class=\"card\"><span>" + add_card_name + "</span><img src=\"/image/star_off.png\" class=\"star-before\"></li>");

                // Card 생성 후 modal 종료
                var modal = document.getElementById('add-card-modal');
                //alert(modal);
                modal.style.display = "none";
                //alert(add_list_name);
            });
        });

        // element 추가할 때 이벤트 다시 등록하기
        $("#list").on("click",".list", function() {
            $(".sortable .list-contents").sortable({
                connectWith: ".sortable .list-contents"
            }).disableSelection();
            $(".sortable").draggable({ containment: "#list", scroll: false });
            /*$(".add-card-button").on("click", function() {
                // 클릭한 버튼이 속한 div 의 id 얻기
                var div_id = document.getElementById($(this).closest("div").attr("id"));
                // div 의 list(.list-contents)
                var new_card = div_id.children[1];
                //alert(new_card);
                $(new_card).append("<li class=\"card\"><span>Item</span><img src=\"/image/star_off.png\" class=\"star-before\"></li>");
            });*/
        })

        // test 용
        $(function() {
            $(".test").click(function () {
            var get_id = document.getElementById("test");
            alert(get_id);
            });
        });

        var modal_list = document.getElementById('add-list-modal');
        // modal 밖 클릭시 modal 종료
        window.onclick = function (event) {
            if (event.target == modal_list) {
                modal_list.style.display = "none";
            }
        };

        var modal_card = document.getElementById('add-card-modal');
        // modal 밖 클릭시 modal 종료
        window.onclick = function (event) {
            if (event.target == modal_card) {
                modal_card.style.display = "none";
            }
        };

        var modal_more_menu = document.getElementById('more-menu-modal');
        // modal 밖 클릭시 modal 종료
        window.onclick = function (event) {
            if (event.target == modal_more_menu) {
                modal_more_menu.style.display = "none";
            }
        };
    });
</script>

</body>
</html>