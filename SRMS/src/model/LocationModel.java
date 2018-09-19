package model;

public class LocationModel 
{
	private int locId;
	private String locName;
	private String locCity;
	private String locState;
	private String locAddress;
	private String description;
	private int isActive;
	
	@Override
	public String toString() {
		return "LocationModel [locId=" + locId + ", locName=" + locName + ", locCity=" + locCity + ", locState="
				+ locState + ", locAddress=" + locAddress + ", description=" + description + ", isActive=" + isActive
				+ "]";
	}
	
	
	
	
	
	
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public String getLocCity() {
		return locCity;
	}
	public void setLocCity(String locCity) {
		this.locCity = locCity;
	}
	public String getLocState() {
		return locState;
	}
	public void setLocState(String locState) {
		this.locState = locState;
	}
	public String getLocAddress() {
		return locAddress;
	}
	public void setLocAddress(String locAddress) {
		this.locAddress = locAddress;
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
	
	
	
	
	
	
	

}
