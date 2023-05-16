<%-- 
    Document   : login
    Created on : 17 Dec 2022, 16:19:24
    Author     : Nitya
--%>

<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("com.mysql.jdbc.Driver");  
Connection con2;
con2 = DriverManager.getConnection(  
                    "jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1","nitya","Born@2001");
            
            
 Statement stmt;
 ResultSet rslt;            
            
String username = request.getParameter("username");
String psw = request.getParameter("psw");

String selectquery = "select userid from account where username='" + username + "' and password='" + psw + "'";
stmt=con2.createStatement();
ResultSet rls= stmt.executeQuery(selectquery);
if (rls.next()) {
Cookie cookie = new Cookie("currentuser",rls.getString(1));
response.addCookie(cookie);

%>
<script>
alert("Login successfull!");
window.location.href="menu.html";
con2.close();
</script>
<%} else {%>
<script>
alert("No Record Found, Try again");
window.location.href="registration.html";
con2.close();
</script>
<%}%>
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
