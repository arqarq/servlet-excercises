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

@WebServlet(name = "UserProfileDeleteController", value = "/userProfileDelete")
public class UserProfileDeleteController extends HttpServlet {
    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDTO userById = userService.getUserById(Long.parseLong(id));
        request.setAttribute("userById", userById);
        request.getRequestDispatcher("WEB-INF/userDeleted.jsp").forward(request, response);
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        userService.deleteUser(null);
//    }
}
