package pl.sdacademy.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.stream.Collectors;

@WebServlet(name = "LoginErrorServlet", value = "/loginError")
public class LoginErrorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<String> validationMessages = (Collection<String>) request.getAttribute("validationMessages");
        response.getWriter().println("<html>" +
                "<body>" +
                validationMessages.stream()
                        .map(message -> "<p>" + message + "</p>")
                        .collect(Collectors.joining()) +
                "</body>" +
                "</html>");
    }
}
