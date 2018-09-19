package model;

public class FeatureModel {

	private int feaId; // primary key
	private String feaType; // unique
	private String description; // not null
	private String iconPath; // not null
	private int isActive;
	
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getFeaId() {
		return feaId;
	}
	public void setFeaId(int feaId) {
		this.feaId = feaId;
	}
	public String getFeaType() {
		return feaType;
	}
	public void setFeaType(String feaType) {
		this.feaType = feaType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIconPath() {
		return iconPath;
	}
	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}
	@Override
	public String toString() {
		return "FeatureModel [feaId=" + feaId + ", feaType=" + feaType + ", description=" + description + ", iconPath="
				+ iconPath + ", isActive=" + isActive + "]";
	}
	
}
