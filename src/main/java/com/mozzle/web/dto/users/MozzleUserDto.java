package com.mozzle.web.dto.users;


import org.springframework.web.multipart.MultipartFile;

public class MozzleUserDto {

	private String user_id;
	private String mozzle_id;
	private String auth_code;
	private String nickname;
	private String joined_date;
	private String birthday_show;
	private String image_origin;
	private String image_saved;
	private MultipartFile file;
	private String postcnt;
	private String email;
	
	
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcnt() {
		return postcnt;
	}
	public void setPostcnt(String postcnt) {
		this.postcnt = postcnt;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMozzle_id() {
		return mozzle_id;
	}
	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getJoined_date() {
		return joined_date;
	}
	public void setJoined_date(String joined_date) {
		this.joined_date = joined_date;
	}
	public String getBirthday_show() {
		return birthday_show;
	}
	public void setBirthday_show(String birthday_show) {
		this.birthday_show = birthday_show;
	}
	public String getImage_origin() {
		return image_origin;
	}
	public void setImage_origin(String image_origin) {
		this.image_origin = image_origin;
	}
	public String getImage_saved() {
		return image_saved;
	}
	public void setImage_saved(String image_saved) {
		this.image_saved = image_saved;
	}
	@Override
	public String toString() {
		return "MozzleUserDto [user_id=" + user_id + ", mozzle_id=" + mozzle_id + ", auth_code=" + auth_code
				+ ", nickname=" + nickname + ", joined_date=" + joined_date + ", birthday_show=" + birthday_show
				+ ", image_origin=" + image_origin + ", image_saved=" + image_saved + "]";
	}
}
