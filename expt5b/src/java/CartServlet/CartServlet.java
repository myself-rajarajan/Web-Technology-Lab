/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CartServlet;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
// Retrieve or create a session
HttpSession session = request.getSession();
// Get the item from the request
String item = request.getParameter("item");
// Retrieve the cart from the session, or create a new one if it doesn't exist
ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
if (cart == null) {
cart = new ArrayList<String>();
}
// Add the item to the cart
cart.add(item);
// Save the updated cart back to the session
session.setAttribute("cart", cart);
// Redirect to a confirmation page
response.sendRedirect("index.html");
}
}
