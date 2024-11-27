package InvokeServlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InvokeServlet")
public class InvokeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String mobile = request.getParameter("mobile");
        
        out.println("<html><body>");
        out.println("<h2>Submitted Details:</h2>");
        out.println("<p>Name: " + name + "</p>");
        out.println("<p>Email ID: " + email + "</p>");
        out.println("<p>Username: " + username + "</p>");
        out.println("<p>Mobile Number: " + mobile + "</p>");
        out.println("</body></html>");
        out.close();
    }
}
