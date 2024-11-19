<%@ page import="javax.xml.namespace.QName" %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.xml.ws.Service" %>
<%@ page import="com.rajarajan2.CCI" %> <!-- Import the web service interface -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .form-container { margin-top: 20px; }
        input, select { padding: 10px; margin: 5px 0; }
    </style>
</head>
<body>
    <h1>Currency Converter</h1>

    <!-- Form to input the currency and amount -->
    <form action="CurrencyConverter.jsp" method="post">
        <label for="fromCurrency">From Currency:</label>
        <select id="fromCurrency" name="fromCurrency">
            <option value="USD">USD</option>
            <option value="EUR">EUR</option>
        </select><br>
        
        <label for="toCurrency">To Currency:</label>
        <select id="toCurrency" name="toCurrency">
            <option value="EUR">EUR</option>
            <option value="USD">USD</option>
        </select><br>
        
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" required /><br>
        
        <input type="submit" value="Convert" />
    </form>

    <div class="form-container">
        <% 
        // Get form parameters
        String fromCurrency = request.getParameter("fromCurrency");
        String toCurrency = request.getParameter("toCurrency");
        String amountStr = request.getParameter("amount");
        double convertedAmount = 0;

        // If parameters are available, invoke the web service
        if (fromCurrency != null && toCurrency != null && amountStr != null) {
            try {
                double amount = Double.parseDouble(amountStr);

                // Construct the WSDL URL and service QName
                URL url = new URL("http://localhost:8080/rajarajan2/CC1Service?WSDL");
                QName qname = new QName("http://rajarajan2.com/", "CC1Service");

                // Create the service and get the port (interface)
                Service service = Service.create(url, qname);
                CCI port = service.getPort(CCI.class); // Use the CCI interface

                // Call the web service method
                convertedAmount = port.convertCurrency(fromCurrency, toCurrency, amount);
            } catch (Exception e) {
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            }
        }

        // Display the result if available
        if (convertedAmount != 0) {
            out.println("<h3>Converted Amount: " + convertedAmount + "</h3>");
        }
        %>
    </div>
</body>
</html>
