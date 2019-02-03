package pl.sdacademy.registration.Service;

import pl.sdacademy.registration.Address;
import pl.sdacademy.registration.DAO.UserDAO;
import pl.sdacademy.registration.DTO.AddressDTO;
import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.User;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class UserService {
    @Inject
    private UserDAO userDAO;

    void saveUser(UserDTO userDTO) {
        User user = new User();
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());

        AddressDTO addressDTO = userDTO.getAddressDTO();
        if (addressDTO != null) {
            Address address = new Address();
            address.setCity(addressDTO.getCity());
            address.setStreet(addressDTO.getStreet());
            address.setHouseNo(addressDTO.getHouseNo());
            user.setAddress(address);
        }
        userDAO.saveUser(user);
    }
}
