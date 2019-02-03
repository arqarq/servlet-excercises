package pl.sdacademy.registration.DTO;

import pl.sdacademy.registration.Address;

public class AddressDTO {
    private Long id;
    private String city;
    private String street;
    private String houseNo;

    public AddressDTO() {
    }

    AddressDTO(Address address) {
        this.id = address.getId();
        this.city = address.getCity();
        this.street = address.getStreet();
        this.houseNo = address.getHouseNo();
    }

    public Long getId() {
        return id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNo() {
        return houseNo;
    }

    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }

    @Override
    public String toString() {
        return city + ", " + street + " " + houseNo;
    }
}
