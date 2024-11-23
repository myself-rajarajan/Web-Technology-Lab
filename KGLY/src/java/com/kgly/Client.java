package com.kgly;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.URL;

public class Client {
    public static void main(String[] args) {
        try {
            // The URL of the WSDL file for the web service
            URL url = new URL("http://localhost:8080/KGLY/KilometerLightYearService?WSDL");

            // The QName must match the service name and target namespace from the WSDL
            QName qname = new QName("http://kgly.com/", "KilometerLightYearService");

            // Create a Service object from the WSDL URL and QName
            Service service = Service.create(url, qname);

            // Get the port (the client-side proxy) for the KilometerLightYearI interface
            KilometerLightYearI port = service.getPort(KilometerLightYearI.class);

            // Call the method on the service and print the result
            double result = port.convert("Kilometer", "LightYear", 1e13); // 10 trillion KM
            System.out.println("Converted Amount: " + result + " LightYears");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}