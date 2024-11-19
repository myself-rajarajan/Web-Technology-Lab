<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Airlines</title>
</head>
<body>
    <h1>Search for Airlines</h1>
    <form action="searchResults.jsp" method="get">
        <label for="origin">Origin:</label>
        <input type="text" id="origin" name="origin">
        <br>
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination">
        <br>
        <input type="submit" value="Search">
    </form>
</body>
</html>
