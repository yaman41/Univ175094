package univelec.dto;

public class UserDTO {

	private int code;
	private String password;
	private String name;
	private String kana;
	private String phone;
	private String mail;
	private int privilege;

	public UserDTO(int code){
		this.code = code;
	}

	public UserDTO(int code, String password, String name, String kana, String phone, String mail){
		this.code = code;
		this.password = password;
		this.name = name;
		this.kana = kana;
		this.phone = phone;
		this.mail = mail;
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKana() {
		return kana;
	}
	public void setKana(String kana) {
		this.kana = kana;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}



}
