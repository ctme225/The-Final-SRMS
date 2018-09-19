package model;

public class ResourceFeatureModel {

	private int resFeaId; // primary key
	private int feaId; // references Feature(feaId)
	private int locResId; // references LocationResource(locResId)
	private int quantity; // not null
	private String description; // not null
	private int isActive;
	
	public int getResFeaId() {
		return resFeaId;
	}
	public void setResFeaId(int resFeaId) {
		this.resFeaId = resFeaId;
	}
	public int getFeaId() {
		return feaId;
	}
	public void setFeaId(int feaId) {
		this.feaId = feaId;
	}
	public int getLocResId() {
		return locResId;
	}
	public void setLocResId(int locResId) {
		this.locResId = locResId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "ResourceFeatureModel [resFeaId=" + resFeaId + ", feaId=" + feaId + ", locResId=" + locResId
				+ ", quantity=" + quantity + ", description=" + description + ", isActive=" + isActive + "]";
	}
	
}
