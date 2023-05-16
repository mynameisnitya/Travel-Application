/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RandomNumber;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Nitya Puspaceno
 */
@Path("RandomNumber")
public class RandomNumber {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of getrandomnumber
     */
    public RandomNumber() {
    }

    /**
     * Retrieves representation of an instance of RandomNumber.getrandomnumber
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() throws MalformedURLException, IOException {
        
    StringBuilder response=new StringBuilder();
      URL url = new URL("https://csrng.net/csrng/csrng.php?min=0&max=100000");
HttpURLConnection con = (HttpURLConnection) url.openConnection();
con.setRequestMethod("GET");
con.connect();

try(BufferedReader br = new BufferedReader(
  new InputStreamReader(con.getInputStream()))) {
   
    String responseLine = null;
    
    while ((responseLine = br.readLine()) != null) {
        response.append(responseLine.trim());
    }
    
   
    } return response.toString();
    }
    /**
     * PUT method for updating or creating an instance of getrandomnumber
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
