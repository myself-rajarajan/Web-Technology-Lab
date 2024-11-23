<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.xml.ws.Service" %>
<%@ page import="com.kgly.KilometerLightYearI" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kilometer to LightYear Converter</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .form-container { margin-top: 20px; }
        input, select { padding: 10px; margin: 5px 0; }
    </style>
</head>
<body>
    <h1>Kilometer to LightYear Converter</h1>

    <!-- Form to input the unit and value -->
    <form action="KilometerLightYearConverter.jsp" method="post">
        <label for="fromUnit">From Unit:</label>
        <select id="fromUnit" name="fromUnit">
            <option value="Kilometer">Kilometer</option>
            <option value="LightYear">LightYear</option>
        </select><br>
        
        <label for="toUnit">To Unit:</label>
        <select id="toUnit" name="toUnit">
            <option value="LightYear">LightYear</option>
            <option value="Kilometer">Kilometer</option>
        </select><br>
        
        <label for="value">Value:</label>
        <input type="number" id="value" name="value" required /><br>
        
        <input type="submit" value="Convert" />
    </form>

    <div class="form-container">
        <% 
        // Get form parameters
        String fromUnit = request.getParameter("fromUnit");
        String toUnit = request.getParameter("toUnit");
        String valueStr = request.getParameter("value");
        double convertedValue = 0;

        // If parameters are available, invoke the web service
        if (fromUnit != null && toUnit != null && valueStr != null) {
            try {
                double value = Double.parseDouble(valueStr);

                // Construct the WSDL URL and service QName
                URL url = new URL("http://localhost:8080/KGLY/KilometerLightYearService?WSDL");
                QName qname = new QName("http://kgly.com/", "KilometerLightYearService");

                // Create the service and get the port (interface)
                Service service = Service.create(url, qname);
                KilometerLightYearI port = service.getPort(KilometerLightYearI.class);

                // Call the web service method
                convertedValue = port.convert(fromUnit, toUnit, value);
            } catch (Exception e) {
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            }
        }

        // Display the result if available
        if (convertedValue != 0) {
            out.println("<h3>Converted Value: " + convertedValue + "</h3>");
        }
        %>
    </div>
</body>
</html>