package model;


public class UsersModel 
{
	private int userId;
	private int locId;
	private String Name;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userType;
	private String userPhone;
	private int isActive;
	
	@Override
	public String toString() {
		return "UsersModel  [UserId=" + userId + ",locId=" + locId + ", userName=" + userName + ",userEmail="
				+userEmail+ ", userPassword=" + userPassword + ",  userType=" +  userType
				+ ", userPhone=" + userPhone + "]";
	}
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public int getIsActive() {
		return isActive;
	}


	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}


	public String getName() {
		return Name;
	}


	public void setName(String name) {
		Name = name;
	}


	
	
	

}
