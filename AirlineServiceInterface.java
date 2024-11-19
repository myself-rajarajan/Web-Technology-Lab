package com.rajarajan1;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.List;

@WebService
public interface AirlineServiceInterface {
    
    @WebMethod
    List<String[]> searchAirlines(String origin, String destination);
}
