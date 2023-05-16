<%-- 
    Document   : savetrip
    Created on : 19 Dec 2022, 15:04:01
    Author     : Nitya Puspaceno
--%>


<%@page import="weatherjson.Day"%>
<%@page import="weatherjson.Location"%>
<%@page import="randomjson.Random"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
        String place = request.getParameter("place"); 
String start = request.getParameter("start");
String end = request.getParameter("end");
    
place=place.replaceAll(" ", "+");
URL weatherRest= new URL("http://20.226.60.2:8080/TravelApp/webresources/WeatherForecast?place=" +place+"?");
HttpURLConnection weatherconection = (HttpURLConnection) weatherRest.openConnection();


weatherconection.setRequestMethod("GET");

weatherconection.connect();

   StringBuilder json = new StringBuilder();

try(BufferedReader br = new BufferedReader(
  new InputStreamReader(weatherconection.getInputStream()))) {
   
    String responseLine = null;
    while ((responseLine = br.readLine()) != null) {
        json.append(responseLine.trim());
        
            //handle invalid location exception
    }}
        GsonBuilder builder = new GsonBuilder();
            builder.setPrettyPrinting();
            Gson gson = builder.create();
            
    Location wf= gson.fromJson(json.toString(), Location.class);
             Day[] days = wf.getDays();

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
  GsonBuilder builder2 = new GsonBuilder();
 builder2.setPrettyPrinting();
    Gson gson2 = builder2.create();
            
  Random Random;
            Random = gson2.fromJson(jsonStringSorted, Random.class);
            id= Long.toString(Random.random);
   
    
    String user_id ;

Cookie cookie = null;
 Cookie[] cookies = null;
 cookies = request.getCookies();
 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
   cookie = cookies[i];

   if (cookie.getName().equals("currentuser")) {
   user_id = cookie.getValue();
   try
{
ResultSet rs =null;
Class.forName("com.mysql.jdbc.Driver");
Connection conDB=    DriverManager.getConnection("jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");
    


PreparedStatement stmt2; 
stmt2 = conDB.prepareStatement("INSERT INTO travelappdb.trip (tripId,location,startDate,endDate,userid) VALUES (?,?,?,?,?)") ;
stmt2.setString(1,id);
stmt2.setString(2,wf.getResolvedAddress().toString());
stmt2.setString(3,start);
stmt2.setString(4,end);
stmt2.setString(5,user_id);
stmt2.execute();





conDB.close();

stmt2.close();
}catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} 
   
   
    }%>

 
<script>
alert("Trip added successfully");
window.location.href="menu.html";
</script>
<%}
    
    
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
