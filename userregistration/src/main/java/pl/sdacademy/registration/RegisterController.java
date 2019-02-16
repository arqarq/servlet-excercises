package pl.sdacademy.registration;

import pl.sdacademy.registration.DTO.AddressDTO;
import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.service.UserService;
import pl.sdacademy.registration.util.UserRegisterValidator;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "RegisterController", value = "/newUser")
public class RegisterController extends HttpServlet {
    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/userCreate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDTO userToRegister = new UserDTO();
        AddressDTO addressOfTheUserToRegister = new AddressDTO();

        request.setCharacterEncoding("utf-8");

        userToRegister.setFirstName(request.getParameter("firstName"));
        userToRegister.setLastName(request.getParameter("lastName"));
        addressOfTheUserToRegister.setCity(request.getParameter("city"));
        addressOfTheUserToRegister.setStreet(request.getParameter("street"));
        addressOfTheUserToRegister.setHouseNo(request.getParameter("houseNo"));
        userToRegister.setAddressDTO(addressOfTheUserToRegister);

        Collection<String> errorStrings = UserRegisterValidator.validateUser(userToRegister);
        if (errorStrings.isEmpty()) {
            userService.saveUser(userToRegister);
        } else {
            request.setAttribute("errorsFromValidation", errorStrings);
        }
        request.getRequestDispatcher("WEB-INF/userAdded.jsp").forward(request, response);
    }
}
