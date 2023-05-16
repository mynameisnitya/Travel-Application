<%-- 
    Document   : logof
    Created on : 20 Dec 2022, 11:11:37
    Author     : Nitya Puspaceno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
for(int i=0; cookies.length>i; i++){

if ((cookies[i].getName( )).compareTo("currentuser") == 0 ) {

cookies[i].setMaxAge(0);
response.addCookie(cookies[i]);}
%>
<script>alert("You have been signed out successfull!");
window.location.href="login.html";
</script>
<%
    }
%>
    




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
