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
int score = 0;
int totalQuestions = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    String query = "SELECT * FROM questions";
    preparedStatement = connection.prepareStatement(query);
    rs = preparedStatement.executeQuery();
    while (rs.next()) {
        totalQuestions++;
        int questionId = rs.getInt("question_id");
        String correctOption = rs.getString("correct_option");
        String userAnswer = request.getParameter("q" + questionId);
        if (userAnswer != null && userAnswer.equals(correctOption)) {
            score++;
        }
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
float percentage = (float) score / totalQuestions * 100;
%>
<html>
<head>
    <title>Exam Result</title>
</head>
<body>
    <h2>Exam Result</h2>
    <!-- Display user details in a table -->
    <table border="1">
        <tr>
            <th>Name</th>
            <th>SIT ID</th>
            <th>Registration No</th>
            <th>Score</th>
        </tr>
        <tr>
            <td><%= name %></td>
            <td><%= sitId %></td>
            <td><%= regNo %></td>
            <td><%= score %> / <%= totalQuestions %></td>
        </tr>
    </table>

    <!-- Display percentage score separately -->
    <h3>Your Score: <%= percentage %> %</h3>
</body>
</html>