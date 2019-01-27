package pl.sdacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "MainServlet", value = "/main")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        String user = (String) httpSession.getAttribute("user");
        response.getWriter().println("<html>" +
                "<body>" +
                "<p>Witaj " +
//                request.getAttribute("ifSuccess") +
                user +
                "</p>" +
                "</body>" +
                "</html>");
    }
}
