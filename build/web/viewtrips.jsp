<%-- 
    Document   : viewtrips
    Created on : 19 Dec 2022, 19:45:23
    Author     : Nitya Puspaceno
--%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
 Class.forName("com.mysql.jdbc.Driver");  
Connection con2;
con2 = DriverManager.getConnection("jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");
            
            
 Statement stmt;
 ResultSet rslt;            
            
 String user_id=null ;

Cookie cookie = null;
 Cookie[] cookies = null;
 cookies = request.getCookies();
 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
   cookie = cookies[i];

   if (cookie.getName().equals("currentuser")) {
   user_id = cookie.getValue();}}}

String selectquery = "SELECT * from travelappdb.trip WHERE userId=" + user_id;
stmt=con2.createStatement();
ResultSet rls= stmt.executeQuery(selectquery);




    
%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My trips </title>
    </head>
    <body>
       
        <section id="viewtrips">
        <a href="menu.html">🏠</a>
           <a href="logof.jsp">Sign out</a>
            <h1>View current trips</h1>
        <table class="trips-table">
            <thead>
            <tr>
                <th>Trip ID </th>
                <th>Start Date </th> 
                <th>End Date </th>
                <th>Location </th>
            </tr>
            </thead>
           
            
            <tbody>
            <%while (rls.next()) {%>  
            <tr>
                
            <td><%=rls.getString("tripId")%></td>
            <td><%=rls.getString("startDate")%></td>
            <td><%=rls.getString("endDate")%></td>
            <td><%=rls.getString("location")%></td>
         
            </tr>
            <%}
            con2.close();
            
            %>
            </tbody>    
        </table>
            </section>
    </body>
</html>
