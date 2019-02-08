package pl.sdacademy.registration;

import pl.sdacademy.registration.DTO.AddressDTO;
import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.service.UserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserProfileEditController", value = "/userProfileEdit")
public class UserProfileEditController extends HttpServlet {
    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDTO userById = userService.getUserById(Long.parseLong(id));
        request.setAttribute("userById", userById);
        request.getRequestDispatcher("WEB-INF/userCreate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Long id = Long.parseLong(request.getParameter("id"));
        UserDTO userToUpdate = userService.getUserById(id);
        AddressDTO addressOfTheUserToUpdate = userToUpdate.getAddressDTO();

        userToUpdate.setFirstName(request.getParameter("firstName"));
        userToUpdate.setLastName(request.getParameter("lastName"));
        addressOfTheUserToUpdate.setCity(request.getParameter("city"));
        addressOfTheUserToUpdate.setStreet(request.getParameter("street"));
        addressOfTheUserToUpdate.setHouseNo(request.getParameter("houseNo"));
        userToUpdate.setAddressDTO(addressOfTheUserToUpdate);

        userService.updateUser(userToUpdate);
        request.getRequestDispatcher("WEB-INF/userUpdated.jsp").forward(request, response);
    }
}
