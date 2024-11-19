package com.rajarajan1;

import javax.jws.WebService;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebService(endpointInterface = "com.rajarajan1.AirlineServiceInterface")
public class AirlineService implements AirlineServiceInterface {

    @Override
    public List<String[]> searchAirlines(String origin, String destination) {
        List<String[]> result = new ArrayList<>();

        // JDBC Connection Parameters
        String dbURL ="jdbc:mysql://localhost:3306/AirlineDB?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUsername = "root";
        String dbPassword = "Ttpy@2004";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            try (Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword)) {
                // Prepare SQL query
                String query = "SELECT name, code, origin, destination, departure_time, arrival_time FROM Airlines WHERE origin = ? AND destination = ?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, origin);
                    stmt.setString(2, destination);

                    // Execute the query and store the results
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        // Store airline details in a String array
                        String[] airlineDetails = new String[6];
                        airlineDetails[0] = rs.getString("name");
                        airlineDetails[1] = rs.getString("code");
                        airlineDetails[2] = rs.getString("origin");
                        airlineDetails[3] = rs.getString("destination");
                        airlineDetails[4] = rs.getString("departure_time");
                        airlineDetails[5] = rs.getString("arrival_time");

                        // Add this array to the result list
                        result.add(airlineDetails);
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return result;
    }
}
