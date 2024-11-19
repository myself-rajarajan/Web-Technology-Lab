<%@page import="com.rajarajan1.AirlineServiceInterface"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*, javax.xml.namespace.QName, javax.xml.ws.Service" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h1>Airline Search Results</h1>
    <%
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");

        // Web Service URL
        URL url = new URL("http://localhost:8080/rajarajan1/AirlineServiceService?WSDL");

        // Define QName for the service
        QName qname = new QName("http://rajarajan1.com/", "AirlineServiceService");

        // Create the Service object
        Service service = Service.create(url, qname);

        // Get the Web Service client (port)
        AirlineServiceInterface port = service.getPort(AirlineServiceInterface.class);

        // Call the Web Service to search for airlines
        List<String[]> airlines = port.searchAirlines(origin, destination);

        if (airlines != null && !airlines.isEmpty()) {
    %>
        <table border="1">
            <tr>
                <th>Airline Name</th>
                <th>Code</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
            </tr>
            <%
                for (String[] airline : airlines) {
            %>
            <tr>
                <td><%= airline[0] %></td>
                <td><%= airline[1] %></td>
                <td><%= airline[2] %></td>
                <td><%= airline[3] %></td>
                <td><%= airline[4] %></td>
                <td><%= airline[5] %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        } else {
        %>
        <p>No airlines found for the selected route.</p>
        <%
        }
    %>
</body>
</html>
