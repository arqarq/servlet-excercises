package pl.sdacademy.registration.util;

import org.apache.commons.lang3.StringUtils;
import pl.sdacademy.registration.DTO.UserDTO;

import java.util.ArrayList;
import java.util.Collection;

public class UserRegisterValidator {
    public static Collection<String> validateUser(UserDTO user) {
        Collection<String> validationMessages = new ArrayList<>();

        if (StringUtils.isBlank(user.getFirstName())) {
            validationMessages.add("Imię nie może być puste");
        }
        if (StringUtils.isBlank(user.getLastName())) {
            validationMessages.add("Nazwisko nie może być puste");
        }
        if (StringUtils.isBlank(user.getAddressDTO().getCity())) {
            validationMessages.add("Miasto nie może być puste");
        }
        if (StringUtils.isBlank(user.getAddressDTO().getStreet())) {
            validationMessages.add("Nazwa ulicy nie może być pusta");
        }
        if (StringUtils.isBlank(user.getAddressDTO().getHouseNo())) {
            validationMessages.add("Numer domu nie może być pusty");
        }
        return validationMessages;
    }
}
