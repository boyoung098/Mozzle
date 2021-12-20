package com.mozzle.web.dto.schedule;

import java.io.Serializable;

public class ScheduleLocationInfoDto implements Serializable{

	private static final long serialVersionUID = 3746867421348151786L;

	private String location_code;
	private String location_name;
	private String address;
	private String address2;
	private String phone;
	private Float logui;
	private Float lat;
	
	public ScheduleLocationInfoDto() {
		
	}

	public String getLocation_code() {
		return location_code;
	}

	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Float getLogui() {
		return logui;
	}

	public void setLogui(Float logui) {
		this.logui = logui;
	}

	public Float getLat() {
		return lat;
	}

	public void setLat(Float lat) {
		this.lat = lat;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ScheduleLocationInfoDto [location_code=" + location_code + ", location_name=" + location_name
				+ ", address=" + address + ", address2=" + address2 + ", phone=" + phone + ", logui=" + logui + ", lat="
				+ lat + "]";
	}

	public ScheduleLocationInfoDto(String location_code, String location_name, String address, String address2,
			String phone) {
		super();
		this.location_code = location_code;
		this.location_name = location_name;
		this.address = address;
		this.address2 = address2;
		this.phone = phone;
	}
	
	
	
}
