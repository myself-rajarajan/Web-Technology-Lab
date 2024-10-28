<%-- 
    Document   : studentMarks
    Created on : Oct 17, 2024, 8:28:55 PM
    Author     : rajar
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Mark List</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Student Mark List</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Mathematics</th>
            <th>Computer Science</th>
            <th>Physics</th>
            <th>Chemistry</th>
            <th>Biology</th>
            <th>Calculated GPA</th>
        </tr>
        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/student_db";
            String username = "root";
            String password = "Ttpy@2004";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;


            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                conn = DriverManager.getConnection(url, username, password);

                // Create SQL query
                String query = "SELECT * FROM student_marks";

                // Execute the query
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
                while (rs.next()) {
                    int student_id = rs.getInt("student_id");
                    String name = rs.getString("name");
                    int mathematics = rs.getInt("Mathematics");
                    int computer_science = rs.getInt("Computer_Science");
                    int physics = rs.getInt("Physics");
                    int chemistry = rs.getInt("Chemistry");
                    int biology = rs.getInt("Biology");
                    double gpa = rs.getDouble("calculated_gpa");
                    %>
                    <tr>
                        <td><%= student_id %></td>
                        <td><%= name %></td>
                        <td><%= mathematics %></td>
                        <td><%= computer_science %></td>
                        <td><%= physics %></td>
                        <td><%= chemistry %></td>
                        <td><%= biology %></td>
                        <td><%= gpa %></td>
                    </tr>
                    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </table>
</body>
</html>

