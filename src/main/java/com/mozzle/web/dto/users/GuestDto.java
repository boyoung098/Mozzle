package com.mozzle.web.dto.users;

public class GuestDto {

	private String mozzle_id;
	private String uuid;
	
	public String getMozzle_id() {
		return mozzle_id;
	}
	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public GuestDto(String mozzle_id, String uuid) {
		super();
		this.mozzle_id = mozzle_id;
		this.uuid = uuid;
	}
	
	@Override
	public String toString() {
		return "GuestDto [mozzle_id=" + mozzle_id + ", uuid=" + uuid + "]";
	}
	
	
}
