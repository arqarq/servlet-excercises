package pl.sdacademy;

import org.junit.Before;
import org.junit.Test;
import pl.sdacademy.login.LoginValidator;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class LoginValidatorTest {
    private static final String USERNAME = "JavaKtw9";
    private static final String PASSWORD = "Sda2019";
    private LoginValidator loginValidatorSUT;

    @Before
    public void setup() {
        loginValidatorSUT = new LoginValidator();
    }

    @Test
    public void isValidShouldReturnFalseIfUsernameEmpty() {
        // Given
        String userName = "";
        // When
        boolean valid = loginValidatorSUT.isValid(userName, PASSWORD);
        // Then
        assertThat(valid, is(false));
    }

    @Test
    public void isValidShouldReturnFalseIfPasswordEmpty() {
        // Given
        String password = "";
        // When
        boolean valid = loginValidatorSUT.isValid(USERNAME, password);
        // Then
        assertThat(valid, is(false));
    }

    @Test
    public void isValidShouldReturnFalseIfUsernameLengthBelow6() {
        // Given
        String userName = "abcde";
        // When
        boolean valid = loginValidatorSUT.isValid(userName, PASSWORD);
        // Then
        assertThat(valid, is(false));
    }

    @Test
    public void isValidShouldReturnFalseIfPasswordLengthBelow6() {
        // Given
        String password = "abcde";
        // When
        boolean valid = loginValidatorSUT.isValid(USERNAME, password);
        // Then
        assertThat(valid, is(false));
    }

    @Test
    public void isValidCaseSensitive() {
        // Given
        String userName = "Javaktw9";
        // When
//        boolean valid = "sda".equals(userName); // unikamy nullpointera
        boolean valid = loginValidatorSUT.isValid(userName, PASSWORD);
        // Then
        assertThat(valid, is(false));
    }

    @Test
    public void isValidCorrectLogin() {
        // Given
        // When
        boolean valid = loginValidatorSUT.isValid(USERNAME, PASSWORD);
        // Then
        assertThat(valid, is(true));
    }
}
