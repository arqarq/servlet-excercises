package pl.sdacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String password = request.getParameter("password");

        if (!new LoginValidator().isValid(user, password)) {
//            response.getWriter().println("Invalid user or password");
            request.setAttribute("validationMessages", Arrays.asList(
                    "Invalid user name or password",
                    "Password cannot be empty"));
            request.getRequestDispatcher("/loginError").forward(request, response);
            return;
        }
        response.getWriter().println("Valid user");
    }
}
