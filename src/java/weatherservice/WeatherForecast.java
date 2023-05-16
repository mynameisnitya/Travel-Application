/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weatherservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Nitya Puspaceno
 */
@Path("WeatherForecast")
public class WeatherForecast {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of WeatherForecast
     */
    public WeatherForecast() {
    }

    /**
     * Retrieves representation of an instance of weatherservice.WeatherForecast
     * @param place
     * @param end
     * @param start
     * @return an instance of java.lang.String
     * @throws java.io.IOException
     * @throws java.lang.InterruptedException
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    //@Consumes(MediaType.CHARSET_PARAMETER)
    public String getJson(@QueryParam ("place")String place,@QueryParam ("end")String end,@QueryParam ("start")String start) throws IOException, InterruptedException {
        //TODO return proper representation object
        StringBuilder response = new StringBuilder();

     //TODO return proper representation object
         Map<String , String> parameters = new HashMap<>();
parameters.put("unitGroup", "metric");
//parameters.put("&","");
parameters.put("include", "days");
//parameters.put("&","");
parameters.put("key", "FD2SN9YCQGS79WC2CJ2ANMEE5");
//parameters.put("&","");
parameters.put("contentType", "json");
//parameters.put("&","");

//unitGroup=metric&include=days&key=FD2SN9YCQGS79WC2CJ2ANMEE5&contentType=json
// Convert parameters to String
String convertedParamsToString;
convertedParamsToString= parameters.toString();
convertedParamsToString=convertedParamsToString.replaceAll(",", "&");
convertedParamsToString=convertedParamsToString.replaceAll(" ","");
convertedParamsToString=convertedParamsToString.replace("}","");
convertedParamsToString=convertedParamsToString.replace("{","");



///leicester?unitGroup=metric&include=days&key=FD2SN9YCQGS79WC2CJ2ANMEE5&contentType=json
URL url = new URL("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/"+place+"/"+start+"/"+end+"?"+ convertedParamsToString);
HttpURLConnection con = (HttpURLConnection) url.openConnection();
con.setRequestMethod("GET");
con.connect();
int response_code=con.getResponseCode();
if(response_code>=400){
    place="lisbon";
    
    URL url2=new URL(
            "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/"
                    +place+"?"+ convertedParamsToString);
    HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
    con=con2;
    con.connect();
}
try(BufferedReader br = new BufferedReader(
  new InputStreamReader(con.getInputStream()))) {
   
    String responseLine = null;
    
    while ((responseLine = br.readLine()) != null) {
        response.append(responseLine.trim());
    }
    

    }return response.toString();}


    /**
     * PUT method for updating or creating an instance of WeatherForecast
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
