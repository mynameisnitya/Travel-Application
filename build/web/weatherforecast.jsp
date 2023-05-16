<%-- 
    Document   : weatherforecast
    Created on : 18 Dec 2022, 11:48:35
    Author     : nitya
--%>



<%@page import="weatherjson.Day"%>
<%@page import="weatherjson.Location"%>
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
URL weatherRest= new URL("http://20.226.60.2:8080/TravelApp/TravelApp/webresources/WeatherForecast");
if(place!=null && start!=null && end!=null ){
place=place.replaceAll(" ", "+");
weatherRest = new URL("http://20.226.60.2:8080/TravelApp/webresources/WeatherForecast"+"?place="+place+"&start="+start+"&end="+end);
    
    
    }
    else{
weatherRest = new URL("http://20.226.60.2:8080/TravelApp/webresources/WeatherForecast");    
    }



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

%>

      

<!DOCTYPE html>
<html>
    <head>
      
        <style>
            body{
                background-color: #1e90ffad;
            }
            a:hover{
                
               background-color:grey; 
            }
            a{background-color: beige;
              display:block;
              margin:10px;
              font-size: 20px;
              padding: 10px;
              text-align: center;
              cursor:pointer;}
              #submit{
                  font-size:15px; margin-top:10px; padding: 12px 32px;
              }
              form{
                  font-size:20px;
              }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a new trip</title>
    </head>
   
         <body   > 
             <a href="menu.html">🏠</a><!-- comment -->
           
             <a href="logof.jsp">Sign out</a>
    <section style="display:flex;flex-direction:column;display:flex;margin-top:2%;margin-left: 5%">
       
   
        <h1>Check the weather for your trip before you create a new trip</h1>
       <!-- method="post" action="http://localhost:8080/TravelApp/webresources/WeatherForecast"-->
     
        <form   >
            <label for="place">Location:</label>
            <br>
            <input  value="Lisbon" type="text" id="place" name="place" required>
            <br>
             <label for="start">Trip start date: </label>
           
             <input type="date" id="start"  name="start" onclick=
"this.setAttribute('max',document.getElementById('end').value)"
                 
       value="2022-12-22"
        required>
            <br>
               <label for="end">Trip end date: </label>
         
               <input type="date" id="end" name="end" 
                 onclick="this.setAttribute('min',document.getElementById('start').value)"
       value="2022-12-22"
        required>
            <br>
            <input id="submit"  onclick="window.location.href='#weather'"  type="submit" value="Get the weather forecast">
            <input id="submit"  padding: 12px 32px;" type="submit" value="Save trip" formaction="savetrip.jsp" ></input>
             
            <input id="submit" formaction="menu.html" type="submit" value="Discard" />
         <!-- comment -->
              <p>Disclaimer: The form will show the forecast for Lisbon if an unknown location or invalid start and end dates are entered.</p>
        </form>
      </section> 
         
    
       <section  id="weather" style="margin-top:2px;margin-left:5%">
             <h1 style=width:89%;>Presenting the weather forecast for <%=wf.getResolvedAddress()%></h1>
             
             <h2 style=width:89%;>Trip from <%=start%> to <%=end%></h2>
   
             <%  for(int i=0;i<days.length;i++){%>
             
             <table style=float:left;width:300px;height:200px;border:2px;text-align:center;border-colour:black;border-style:solid;>
                 <tr>
                   <th style=border:1px;border-colour:black;border-style:solid; >Date</th>
                 </tr>
                    <td><%=days[i].getDatetime().toString()%></td>
                    <tr><th>Temperature </th></tr>
                     <td> <%=days[i].getTemp()%> *C </td>
                     <tr><th>Description </th></tr>   
                     <td><%=days[i].getDescription().toString()%></td>      
                     </table>
             <%}%>
             
             
             
       
             </body>
     
</html>
