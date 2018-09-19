package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationResourceMapper;
import mapper.ResourceFeatureMapper;
import mapper.ResourceMapper;
import model.BookingModel;
import model.FeatureModel;
import model.LocationResourceModel;
import model.ResourceFeatureModel;
import model.ResourceModel;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResourceDAO {
    private JdbcTemplate temp;
    
    public ResourceDAO(){
        temp = Connection.getConnection();
    }
    
    public List<LocationResourceModel> getLoccationResources(){
    	return temp.query("select * from locationresource", new LocationResourceMapper());
    }
    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(resId) from Resources",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    // Return ResourceModel with specified resourceID
    public ResourceModel getResource(int resId) {
    	return (ResourceModel)temp.queryForObject("Select * from Resources where resId = ?", new ResourceMapper(), resId);
    }
    
    // Inserts specified Resource into Resources table
    public int insertResource(ResourceModel res) {
    	return temp.update("insert into Resources values(?,?,?,?,?,?,?,1)",
    			new ResourceDAO().getNextAvailableKey(), res.getRoomNumber(), res.getResName(), 
    			res.getResType(), res.getDescription(), res.getStatus(), res.getAcceptedRole());
    }
    
    public int insertResource(ResourceModel res, int locId) {
    	int resId = new ResourceDAO().getNextAvailableKey();
    	temp.update("insert into Resources values(?,?,?,?,?,?,?,1)",
    			resId, res.getRoomNumber(), res.getResName(), 
    			res.getResType(), res.getDescription(), res.getStatus(), res.getAcceptedRole());
    		int ret = new LocationResourceDAO().insertLocationResource(resId, locId, res.getDescription());
    	return resId;
    }
	
    // Updates isActive column entry to 0 to the specified Resource from Resources table
    public int deleteResource(ResourceModel res) {
    	return temp.update("update Resources set isActive = 0 where resId = ?", res.getResId());
    }
	
    // Updates specified Resource from Resources table
    public int updateResource(ResourceModel res) {
    	return temp.update("update Resources set roomNumber = ?, resName = ?, resType =?, "
    			+ "description = ?, status = ?, acceptedRole = ? where resId = ?",
    			res.getRoomNumber(), res.getResName(), res.getResType(), 
    			res.getDescription(), res.getStatus(), res.getAcceptedRole(), res.getResId());
    }
    
    // Given LocationID and ResourceTypeID, returns list of Resources models with corresponding ID's
    public List<ResourceModel> getResourcesWithLocIDandResTypeID(int locId, int resTypeId){
    	return temp.query("select r.resId, r.roomNumber, r.resName, r.resType, r.description, r.status, r.acceptedRole, "
    			+ "r.isActive from Resources r join LocationResource lr on r.resId = lr.resId where lr.locId = ? and r.resType = ?",
    			new ResourceMapper(), locId, resTypeId);
    }
    
    // Given BookingModel, return the Resource
    public ResourceModel getResourceWithBooking(BookingModel book) {
    	return (ResourceModel)temp.query("select r.resId, r.roomNumber, r.resName, r.resType, r.description, r.status, "
    			+ "r.acceptedRole, r.isActive from Resources r join LocationResource lr on r.resId = lr.resId "
    			+ "where lr.locResId = ?",new ResourceMapper(), book.getLocResID());
    }
    
    // Given List<Resources> return Map<resID,List<Feature>>
    public Map<Integer,List<ResourceFeatureModel>> getResourceFeatureListWithResourceList(List<ResourceModel> resList) {
    	Map<Integer,List<ResourceFeatureModel>> retMap = new HashMap<>();
    	
    	for(int i = 0; i < resList.size(); i++) {
    		retMap.put(resList.get(i).getResId(), 
    				temp.query("select rf.resfeaid, rf.feaid, rf.locresid, rf.quantity, rf.description, rf.isactive from "
    						+ "resourcefeature rf join locationresource lr on rf.locresid = lr.locresid where lr.resid = ?",
    						new ResourceFeatureMapper(), resList.get(i).getResId()));
    	}
    	
    	return retMap;
    }

     
    // Given ResourceTypeID, returns list of Resource models with corresponding ID's
    public List<ResourceModel> getResourcesWithResTypeID(int resTypeId){
    	return temp.query("select * from Resources where resType = ?", new ResourceMapper(), resTypeId);
    }
    public List<LocationResourceModel> getLocationResources(){
        return temp.query("select * from locationresource", new LocationResourceMapper());

    }
    // Returns a list of ResourceModel from Resources table
    public List<ResourceModel> getAllResources() {
    	return temp.query("select * from Resources", new ResourceMapper());
    }

    /*
    public static void main(String s[]) {
    	ResourceDAO res = new ResourceDAO();
    	Map<Integer,List<ResourceFeatureModel>> map = res.getResourceFeatureListWithResourceList(res.getAllResources());
    	
    	for(Integer i : map.keySet()) {
    		for(ResourceFeatureModel m : map.get(i)) {
    		    System.out.println(m.toString());	
    		    System.out.println("----------");
    		}

    	}
    }
    */
    
}
