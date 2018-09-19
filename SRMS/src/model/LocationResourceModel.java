package model;

public class LocationResourceModel
{
    private int ID;
    private int resourceID;
    private int locationID;
    private String description;
    private int isActive;
    
    public int getID() {
        return this.ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getResourceID() {
        return this.resourceID;
    }

    public void setResourceID(int resourceID) {
        this.resourceID = resourceID;
    }

    public int getLocationID() {
        return this.locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getDescription() {
        return this.description;
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
		return "LocationResourceModel [ID=" + ID + ", resourceID=" + resourceID + ", locationID=" + locationID
				+ ", description=" + description + ", isActive=" + isActive + "]";
	}
}