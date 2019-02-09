package pl.sdacademy.registration;

import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.service.UserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserProfileDeleteConfirmedController", value = "/userProfileDeleteConfirmed")
public class UserProfileDeleteConfirmedController extends HttpServlet {
    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Long idOfProfileToDelete = Long.parseLong(id);
        UserDTO userById = userService.getUserById(idOfProfileToDelete);
        userService.deleteUser(userById);
        response.sendRedirect("users");
    }
}
