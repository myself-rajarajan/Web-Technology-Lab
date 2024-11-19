package com.rajarajan2;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.URL;

public class Client {
    public static void main(String[] args) {
        try {
            // The URL of the WSDL file for the web service
            URL url = new URL("http://localhost:8080/rajarajan2/CC1Service?WSDL");

            // The QName must match the service name and the target namespace from the WSDL
            QName qname = new QName("http://rajarajan2.com/", "CC1Service");

            // Create a Service object from the WSDL URL and QName
            Service service = Service.create(url, qname);

            // Get the port (the client-side proxy) for the CCI interface
            CCI port = service.getPort(CCI.class);

            // Call the method on the service and print the result
            double result = port.convertCurrency("USD", "EUR", 100.0);
            System.out.println("Converted Amount: " + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
