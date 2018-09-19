package model;

public class ResourceModel {

	private int resId; // primary key
	private int roomNumber; // not null
	private String resName; // not null
	private int resType; // not null
	private String description; // not null
	private String status; // not null
	private int acceptedRole;
	private int isActive;
	
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public int getResType() {
		return resType;
	}
	public void setResType(int resType) {
		this.resType = resType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "ResourceModel [resId=" + resId + ", roomNumber=" + roomNumber + ", resName=" + resName + ", resType="
				+ resType + ", description=" + description + ", status=" + status + ", photoOfResource="
				+ acceptedRole + ", isActive=" + isActive + "]";
	}
	public int getAcceptedRole() {
		return acceptedRole;
	}
	public void setAcceptedRole(int acceptedRole) {
		this.acceptedRole = acceptedRole;
	}
	
}
