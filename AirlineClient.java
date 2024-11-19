package com.rajarajan1;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.URL;
import java.util.List;

public class AirlineClient {

    public static void main(String[] args) throws Exception {
        // Ensure there are two parameters (origin and destination)
        if (args.length < 2) {
            System.out.println("Usage: AirlineClient <origin> <destination>");
            System.exit(1);
        }
        String origin = args[0];
        String destination = args[1];
        // URL of the WSDL of the deployed Web Service
        URL url = new URL("http://localhost:8080/rajarajan1/AirlineServiceService?WSDL");

        QName qname = new QName("http://rajarajan1.com/", "AirlineServiceService");

        // Create the service object
        Service service = Service.create(url, qname);

        // Get the Web Service client (port) using the interface
        AirlineServiceInterface port = service.getPort(AirlineServiceInterface.class);

        // Call the Web Service method with the dynamic parameters
        List<String[]> airlines = port.searchAirlines(origin, destination);

        System.out.println("Airlines found from " + origin + " to " + destination + ":");
        for (String[] airline : airlines) {
            // Print each airline's details from the String array
            System.out.println("Name: " + airline[0] +
                               ", Code: " + airline[1] +
                               ", Origin: " + airline[2] +
                               ", Destination: " + airline[3] +
                               ", Departure Time: " + airline[4] +
                               ", Arrival Time: " + airline[5]);
        }}}
