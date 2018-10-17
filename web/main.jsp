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
    <link rel="stylesheet" type="text/css" href="../../../front-end/web/css/main.css">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<%-- top menu --%>
<header>
    <a href="#" class="header-logo"><img src="../../../front-end/web/image/header-logo.png" class="logo-image"></a>
    <div class="user">
        <a href="#" class="user-box text"><span class="user-name">amoogae</span></a>
        <a href="#" class="user-box image"><img src="../../../front-end/web/image/round-face-24px.svg" class="user-image"></a>
    </div>
</header>

<main>
    <%-- search bar --%>
    <div class="search-bar">
        <input type="text" name="search" placeholder="검색">
    </div>

    <%-- side menu --%>
    <section class="side-menu float">
        <div>
            <ul id="board-list">
                <a href="board.jsp"><li id="board-name" class="board-li">new</li></a>
            </ul>
            <button id="create-board">board</button>
        </div>

    </section>

    <%-- D-Day --%>
    <section class="d-day float">
        <div>
            bbb

        </div>

    </section>

    <%-- Calendar --%>
    <section class="calendar float">
        ccc

    </section>
</main>

<%--???--%>
<footer>

</footer>

</body>
</html>
