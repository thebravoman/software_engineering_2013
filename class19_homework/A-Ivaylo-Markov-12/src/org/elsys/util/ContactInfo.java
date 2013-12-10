package org.elsys.util;

public class ContactInfo {
	private String city;
	private String zipCode;
	private String streetName;
	private String streetNumber;
	
	private String homePhoneNumber;
	private String stationaryPhoneNumber;
	private String otherPhoneNumber;
	
	private String email;
	private String website;
	private String blog;
	
	public ContactInfo(String city, String zipCode, String streetName,
			String streetNumber, String homePhoneNumber,
			String stationaryPhoneNumber, String otherPhoneNumber,
			String email, String website, String blog) {
		this.city = city;
		this.zipCode = zipCode;
		this.streetName = streetName;
		this.streetNumber = streetNumber;
		this.homePhoneNumber = homePhoneNumber;
		this.stationaryPhoneNumber = stationaryPhoneNumber;
		this.otherPhoneNumber = otherPhoneNumber;
		this.email = email;
		this.website = website;
		this.blog = blog;
	}
	
	
}
