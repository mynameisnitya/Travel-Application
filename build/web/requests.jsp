<%-- 
    Document   : requests
    Created on : 22 Dec 2022, 16:57:27
    Author     : Nitya Puspaceno
--%>


<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="randomjson.Random"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id;
         StringBuilder response_ = new StringBuilder();
        URL url = new URL("http://20.226.60.2:8080/TravelApp/webresources/RandomNumber");
HttpURLConnection con_ = (HttpURLConnection) url.openConnection();
con_.setRequestMethod("GET");
con_.connect();

try(BufferedReader br = new BufferedReader(
  new InputStreamReader(con_.getInputStream()))) {
   
    String responseLine = null;
    
    while ((responseLine = br.readLine()) != null) {
        response_.append(responseLine.trim());
    }
    
    }
    
        StringBuilder jsonSorted =new StringBuilder();
 
    String jsonStringSorted=response_.toString();
    jsonStringSorted=jsonSorted.append(response_.toString()).toString();
    jsonStringSorted=jsonStringSorted.replace("[", "");
    jsonStringSorted=jsonStringSorted.replace("]", "");
  GsonBuilder builder = new GsonBuilder();
 builder.setPrettyPrinting();
    Gson gson = builder.create();
            
  Random Random;
            Random = gson.fromJson(jsonStringSorted, Random.class);
            id= Long.toString(Random.random);
   
    
    
try
{
ResultSet rs =null;
Class.forName("com.mysql.jdbc.Driver");
String tripid = request.getParameter("tripid"); 
Connection conDB=    DriverManager.getConnection("jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");
 PreparedStatement stmt;
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
   String username=null;
String selectquery1 = "SELECT username from travelappdb.account where userid="+user_id;
 Statement stmt2=conDB.createStatement();;
stmt2=conDB.createStatement();
ResultSet rls1= stmt2.executeQuery(selectquery1);
if (rls1.next()) {
username=rls1.getString(1);
    }
 Statement stmt3=conDB.createStatement();;
 String query2="SELECT * FROM travelappdb.maketriprequest WHERE username ='"+username+"'";

ResultSet rls2= stmt3.executeQuery(query2);
  stmt=conDB.prepareStatement("INSERT INTO travelappdb.triprequest ( TripRequestId, trip_buddy_username,request_status,tripid) Values(?,?,?,?) ");
   stmt.setString(1,id);
    stmt.setString(2,username);
     stmt.setString(3,"Requested");
      stmt.setString(4,tripid);
    stmt.execute();


conDB.close();
%>
<script>
    alert("Request added successfully");
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
