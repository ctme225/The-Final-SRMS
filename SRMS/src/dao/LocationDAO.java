package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationMapper;
import mapper.LocationResourceMapper;
import model.LocationModel;
import model.LocationResourceModel;

import java.util.List;

public class LocationDAO {
    private JdbcTemplate temp;

    public LocationDAO(){
        temp = Connection.getConnection();
    }
    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(locId) from Location",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
	public int editLocation(LocationModel loc) {
		return temp.update("update location set locname=?,loccity=?,locstate=?,locaddress=?,description=? where locid=?",loc.getLocName(),loc.getLocCity(),loc.getLocState(),loc.getLocAddress(),loc.getDescription(),loc.getLocId());
	}
	
    // Return LocationModel with specified locationID
    public LocationModel getLocation(int locId) {
    	return (LocationModel)temp.queryForObject("Select * from Location where locId = ?", new LocationMapper(), locId);
    }
    
    // Inserts specified location into Location table
    public int insertLocation(LocationModel loc) {
    	return temp.update("insert into Location values(?,?,?,?,?,?,1)",
    			new LocationDAO().getNextAvailableKey(), loc.getLocName(), loc.getLocCity(), loc.getLocState(), loc.getLocAddress(), loc.getDescription());
    }
	
    // Updates isActive column entry to 0 to the specified location from Location table
    public int deleteLocation(LocationModel loc) {
    	return temp.update("update Location set isActive = 0 where locId = ?", loc.getLocId());
    }
    
    public List<LocationResourceModel> getResId(int locid) {
   	 return temp.query("select * from locationresource where locid = ?", new LocationResourceMapper(), locid);
   }
	
	// Updates isActive column entry to 0 to the specified location from Location table
    public int deleteLocation(int locid) {
    	return temp.update("update Location set isActive = ? where locId = ?", 0, locid);
    }
    // Updates specified location from Location table
    public int updateLocation(LocationModel loc) {
    	return temp.update("update Location set locName = ?, locCity = ?, locState =?, locAddress = ?, description = ? where locId = ?)",
    			loc.getLocName(), loc.getLocCity(), loc.getLocState(), loc.getLocAddress(), loc.getDescription(), loc.getLocId());
    }
    
    // Returns a list of LocationModel from Location table
    public List<LocationModel> getAllLocations() {
    	return temp.query("select * from Location where isActive = 1", new LocationMapper());
    }
    
    public LocationModel getLocationwithID(int locid) {
    	return temp.queryForObject("select * from location where locid = ?", new LocationMapper(), locid);
    }
    public LocationResourceModel getLocationResource(int res,int loc)
    {
        return temp.queryForObject("select * from locationresource where locid=? and resid=?",new LocationResourceMapper(),loc,res);
    }
    public LocationModel getLocIdWithAddress(String name, String city, String state) {
        return temp.queryForObject("select * from location where locname = ? and loccity = ? and locstate = ?",
                new LocationMapper(), name, city, state);
    }

}
