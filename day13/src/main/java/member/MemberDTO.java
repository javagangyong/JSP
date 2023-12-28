package member;

//USERID   NOT NULL VARCHAR2(500) 
//USERPW   NOT NULL VARCHAR2(500) 
//USERNAME NOT NULL VARCHAR2(500) 
//GENDER            VARCHAR2(100) 
//EMAIL    NOT NULL VARCHAR2(100) 

public class MemberDTO {
	
	private String userID;
	private String userPW;
	private String userName;
	private String gender;
	private String email;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
