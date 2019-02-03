package pl.sdacademy.registration;

import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.Service.UserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserProfileController", value = "/userProfile")
public class UserProfileController extends HttpServlet {
    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDTO userById = userService.getUserById(Long.parseLong(id));
        request.setAttribute("userById", userById);
        request.getRequestDispatcher("WEB-INF/user.jsp").forward(request, response);
    }
}
