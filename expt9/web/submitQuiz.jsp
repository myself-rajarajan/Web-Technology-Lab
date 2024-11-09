<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String answers = request.getParameter("answers");
    response.setContentType("text/plain");
    response.getWriter().write("Your answers have been submitted successfully!");
%>