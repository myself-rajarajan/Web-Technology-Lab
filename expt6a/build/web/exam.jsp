<%-- 
    Document   : exam
    Created on : Oct 17, 2024, 7:26:16?PM
    Author     : rajar
--%>

<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
String jdbcURL = "jdbc:mysql://localhost:3306/examdb";
String jdbcUsername = "root";
String jdbcPassword = "Ttpy@2004";

Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet rs = null;

String name = request.getParameter("name");
String sitId = request.getParameter("sitId");
String regNo = request.getParameter("regNo");

try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    String query = "SELECT * FROM questions";
    preparedStatement = connection.prepareStatement(query);
    rs = preparedStatement.executeQuery();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<html>
<head>
    <title>Online Examination</title>
</head>
<body>
    <h2>Online Examination</h2>

    <!-- Display user details -->
    <p><strong>Name:</strong> <%= name %></p>
    <p><strong>SIT ID:</strong> <%= sitId %></p>
    <p><strong>Registration No:</strong> <%= regNo %></p>

    <!-- Display questions -->
    <form action="result.jsp" method="post">
        <input type="hidden" name="name" value="<%= name %>">
        <input type="hidden" name="sitId" value="<%= sitId %>">
        <input type="hidden" name="regNo" value="<%= regNo %>">
        <%
        int questionNumber = 1;
        while (rs.next()) {
        %>
        <div>
            <p><%= questionNumber++ %>. <%= rs.getString("question_text") %></p>
            <input type="radio" name="q<%= rs.getInt("question_id") %>" value="A"> <%= 									rs.getString("option_a") %><br>
            <input type="radio" name="q<%= rs.getInt("question_id") %>" value="B"> <%= 									rs.getString("option_b") %><br>
            <input type="radio" name="q<%= rs.getInt("question_id") %>" value="C"> <%= 									rs.getString("option_c") %><br>
            <input type="radio" name="q<%= rs.getInt("question_id") %>" value="D"> <%= 								rs.getString("option_d") %><br>
        </div>
        <%
        }
        rs.close();
        preparedStatement.close();
        connection.close();
        %>
        <input type="submit" value="Submit Exam">
    </form>
</body>
</html>
