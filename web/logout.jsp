<%--
  Created by IntelliJ IDEA.
  User: shin-yeji
  Date: 06/12/2018
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>


<head>
    <title>Logout</title>
</head>
<body onload="check()">
<script>
    var r = confirm("LOGOUT?");
    if(r==true){
        sessionStorage.clear();
        token="";
        if(!token) location.replace("index.jsp");
    }
    else{
        history.back();
    }

</script>
</body>
</html>