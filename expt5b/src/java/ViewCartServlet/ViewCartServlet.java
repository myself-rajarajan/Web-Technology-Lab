/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ViewCartServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
// Set response content type
response.setContentType("text/html");
PrintWriter out = response.getWriter();
// Retrieve the session, if it exists
HttpSession session = request.getSession(false);
// Display the cart
out.println("<html><body>");
out.println("<h2>Your Shopping Cart:</h2>");
if (session != null) {
ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
if (cart != null && !cart.isEmpty()) {
for (String item : cart) {
out.println("<p>" + item + "</p>");
}} else {
out.println("<p>Your cart is empty.</p>");
}
} else {
out.println("<p>No session found.</p>");
}
out.println("<a href='index.html'>Go Back</a>");
out.println("</body></html>");
out.close();
}
}