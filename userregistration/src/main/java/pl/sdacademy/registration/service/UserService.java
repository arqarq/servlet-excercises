package pl.sdacademy.registration.service;

import pl.sdacademy.registration.model.Address;
import pl.sdacademy.registration.DAO.UserDAO;
import pl.sdacademy.registration.DTO.AddressDTO;
import pl.sdacademy.registration.DTO.UserDTO;
import pl.sdacademy.registration.model.User;

import javax.inject.Inject;
import javax.inject.Singleton;
import java.util.Collection;
import java.util.stream.Collectors;

@Singleton
public class UserService {
    @Inject
    private UserDAO userDAO;

    public void saveUser(UserDTO userDTO) {
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

    public Collection<UserDTO> getUsers() {
        return userDAO.getUsers().stream()
                .map(UserDTO::new)
                .collect(Collectors.toList());
    }

    public UserDTO getUserById(Long userId) {
        User user = userDAO.findById(userId);
        if (user != null) {
            return new UserDTO(user);
        }
        return null;
    }
}
