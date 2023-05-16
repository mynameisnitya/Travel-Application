<%-- 
    Document   : accept
    Created on : 25 Dec 2022, 15:52:23
    Author     : Nitya Puspaceno 
--%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id;

  id = request.getParameter("triprequestid");   
  
   
    
    
try
{
ResultSet rs =null;
Class.forName("com.mysql.jdbc.Driver");

Connection conDB=    DriverManager.getConnection("jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");
 PreparedStatement stmt;
 ResultSet rslt;            
            

 stmt=conDB.prepareStatement("Update travelappdb.triprequest Set request_status=? where TripRequestId=?  ");
   stmt.setString(1,"Accepted");
    stmt.setString(2,id);
    stmt.execute();

conDB.close();
%>
<script>
    window.location.href="make_view_requests.jsp";
    alert("Request accepted added successfully");
</script>
<%
response.sendRedirect("make_view_requests.jsp");
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
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
