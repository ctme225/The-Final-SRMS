package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationResourceMapper;
import model.LocationResourceModel;

import java.util.List;

public class LocationResourceDAO {
    private JdbcTemplate temp;

    public LocationResourceDAO(){
        temp = Connection.getConnection();
    }
    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(locResId) from LocationResource",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    // Return LocationResourceModel with specified locationResourceID
    public LocationResourceModel getLocation(int locResId) {
    	return (LocationResourceModel)temp.queryForObject("Select * from LocationResource where locResId = ?", 
    			new LocationResourceMapper(), locResId);
    }
    
    // Inserts specified LocationResource into LocationResource table
    public int insertLocationResource(int resId, int locId, String desc) {
    	return temp.update("insert into LocationResource values(?,?,?,?,1)",
    			new LocationResourceDAO().getNextAvailableKey(), resId, locId, desc);
    }
	
    // Updates isActive column entry to 0 to the specified LocationResource from LocationResource table
    public int deleteLocationResource(int id) {
    	return temp.update("update LocationResource set isActive = 0 where locResId = ?", id);
    }
	
    // Updates specified LocationResource from LocationResource table
    public int updateLocationResource(LocationResourceModel locRes) {
    	return temp.update("update LocationResource set resId = ?, locId = ?, description =? where locResId = ?)",
    			locRes.getResourceID(), locRes.getLocationID(), locRes.getDescription(), locRes.getID());
    }
    
    // Returns a list of LocationResourceModel from LocationResource table
    public List<LocationResourceModel> getAllLocationResources() {
    	return temp.query("select * from LocationResource", new LocationResourceMapper());
    }

}
