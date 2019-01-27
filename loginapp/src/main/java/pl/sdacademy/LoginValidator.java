package pl.sdacademy;

import org.apache.commons.lang3.StringUtils;

class LoginValidator {
    /**
     * This method validates if username and password are correct
     * If {@code userName} or {@code password} is empty then return false.
     * If {@code userName} or {@code password} length is smaller than 6 then return false.
     * If {@code userName} is Javaktw9 and password is Sda2019 then return true.
     * Username and password are case sensitive.
     *
     * @param userName given user name, case sensitive
     * @param password given password
     * @return returns TRUE if correct login occured or FALSE if not
     */
    private static final String USERNAME = "Javaktw9";
    private static final String PASSWORD = "Sda2019";

    boolean isValid(String userName, String password) {
        if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
            return false;
        }
        if ((userName.length() < 6) || (password.length() < 6)) {
            return false;
        }
        return USERNAME.equals(userName) && PASSWORD.equals(password);
    }
}