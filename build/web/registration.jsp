<%-- 
    Document   : registration
    Created on : 17 Dec 2022, 11:22:05
    Author     : Nitya Puspaceno
--%>

<%@page import="randomjson.Random"%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
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
Connection conDB=    DriverManager.getConnection("jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");

String username=request.getParameter("username");

String psw=request.getParameter("psw");

String email=request.getParameter("email");
PreparedStatement stmt; 
stmt = conDB.prepareStatement("INSERT INTO travelappdb.account (userid, email, username, password) VALUES (?,?,?,?)") ;
   stmt.setString(1,id);
   stmt.setString(2,email);
   stmt.setString(3,username);
   stmt.setString(4, psw);
   stmt.execute();

response.sendRedirect("login.html");


conDB.close();
stmt.close();
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
