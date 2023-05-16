<%-- 
    Document   : make_view_requests
    Created on : 22 Dec 2022, 18:33:06
    Author     : Nitya Puspaceno 
--%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");  
Connection con2;
con2 = DriverManager.getConnection(  
                    "jdbc:mysql://serverforapp.mysql.database.azure.com:3306/travelappdb?characterEncoding=latin1&useConfigs=maxPerformance","nitya","Born@2001");
            
            
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
   String username=null;
String selectquery1 = "SELECT username from travelappdb.account where userid="+user_id;
stmt=con2.createStatement();
ResultSet rls1= stmt.executeQuery(selectquery1);
if (rls1.next()) {
username=rls1.getString(1);
    }
 Statement stmt2=con2.createStatement();
  //Query for table for making a trip request
 String query2="SELECT * FROM travelappdb.maketriprequest WHERE username !='"+username+"'";
  //query for table viewing current user's  trip requests to other users trips 
 String query3="SELECT * FROM travelappdb.viewrequest WHERE trip_buddy_username ='"+username+"'";
   //resultset for table for viewing requests sent to current user's trips
 String query4="SELECT * FROM travelappdb.viewrequest WHERE username ='"+username+"'";
  //resultset for table for making a trip request
ResultSet rls2= stmt2.executeQuery(query2);
 //resultset for table viewing current user's  trip requests to other users trips
  Statement stmt3=con2.createStatement();
ResultSet rls3= stmt3.executeQuery(query3);
 //resultset for table for viewing requests send to current user's trips
   Statement stmt4=con2.createStatement();
ResultSet rls4= stmt4.executeQuery(query4);


    
%>
<!DOCTYPE html>


<html>
    <head>
        <style>section#\31{
    width:45%;
}
section#\32{
  width:50%;
   margin-top:-110px;
 margin-bottom:10px;
 left:1px;
  float:right;
  position:relative;
}
  
#table_scroll{
   
  height: 340px;
  overflow-y: scroll;
 
  position:relative;
  float:left;
}
#table_scroll2{
    overflow-x: scroll;
  height: 550px;
  overflow-y: scroll;
 
   right:0;
 
}

section#2{
 
    margin-top:0;
    right:3px;
   float:right;
}

#request_trip{position:fixed;
float:right;
bottom:10px}</style>
         <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all requests</title>
    </head>
   
    
    <body>
            <a href="menu.html">🏠</a><!-- comment -->
           
             <a href="logof.jsp">Sign out</a>
             
             
        <section id="1" >
            <h1>Express interest in a trip </h1>
                <p>Select a trip:</p>   
            <section id="table_scroll"> 
                <form action="requests.jsp">
                    <input id="request_trip" type="submit" value="Request trip">
                    
                    <table class="trips-table">
            <thead>
            <tr>
              <th>Trip ID </th>
              <th>Username </th>
                <th>Start Date </th>
                <th>End Date </th> 
                
                <th>Location </th>
            </tr>
            </thead>
           
            
            <tbody>
            <%while (rls2.next()) {%>  
            <tr>
            <td><input type="radio" id="tripid" name="tripid" value="<%=rls2.getString("tripId")%>">
                <%=rls2.getString("tripId")%></td>    
            <td><%=rls2.getString("username")%></td>
            
            <td><%=rls2.getString("startDate")%></td>
            <td><%=rls2.getString("endDate")%></td>
            <td><%=rls2.getString("location")%></td>
         
            </tr>
            <%}

            
            %>
             </tbody>    
                    </table>
             </form>
      </section>
      
 </section>          
             <section id="2" >
                   
   
        <section id="table_scroll2"  >          
            
           <h1> My trip Requests   </h1>
       <p>Check the status of my trip requests </p>  
    
       
  

           
  
      <form action="requests.jsp">
        <table class="trips-table2">
            <thead>
            <tr>
                <th>Trip request ID </th>
                <th>Trip buddy username </th>
                <th>Start Date </th>
                <th>End Date </th> 
                <th>Request Status </th>
                <th>Location </th>
            </tr>
            </thead>
           
            
            <tbody>
            <%while (rls3.next()) {%>  
            <tr>
            <td>
                <%=rls3.getString("TripRequestId")%></td>    
            <td><%=rls3.getString("username")%></td>
           <td><%=rls3.getString("startDate")%></td>
            <td><%=rls3.getString("endDate")%></td>
            <td><%=rls3.getString("request_status")%></td>
            <td><%=rls3.getString("location")%></td>
         
            </tr>
            <%}

            
            %>
            </tbody>  
        </table>
          
              </form>
         
            
 
            
   
            
             
               
               
           
       

           
  
      <form action="accept.jsp">
       
          <h1> Expression of interest in my trips  </h1>
       <p>Select a request to accept:</p> 
       <input id="accept" type="submit" value="Accept trip"> 
       <input  formaction="reject.jsp" id="accept" type="submit" value="Reject trip"> 
        <table class="trips-table2">
         
            
            <thead>
            <tr>
                
                <th>Trip ID </th>
                <th>Requester's username </th>
                <th>Start Date </th> 
                <th>End Date </th>
                  <th>Request Status  </th>
                <th>Location </th>
            </tr>
            </thead>
           
            
            <tbody>
            <%while (rls4.next()) {%>  
            <tr>
            <td>
                
                <input type="radio" id="tripid" name="triprequestid" value="<%=rls4.getString("TripRequestId")%>">
                <%=rls4.getString("tripid")%></td>    
           
              <td><%=rls4.getString("trip_buddy_username")%>
         </td>
            <td><%=rls4.getString("startDate")%></td>
            <td><%=rls4.getString("endDate")%></td>
              <td><%=rls4.getString("request_status")%></td>
           <td><%=rls4.getString("location")%></td>
       
            </tr>
            <%}
con2.close();
            
            %>
            </tbody>    
        </table>
              </form>
         
            
   </section>
            
     </section>
             
     
             
             
             
          
    </body>
</html>
