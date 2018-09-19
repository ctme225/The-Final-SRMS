package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.ResourceFeatureMapper;
import model.ResourceFeatureModel;

import java.sql.ResultSet;
import java.util.List;

public class ResourceFeatureDAO {
    private JdbcTemplate temp;
    
    public ResourceFeatureDAO(){
        temp = Connection.getConnection();
    }
    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(resFeaId) from ResourceFeature",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    // Return ResourceFeatureModel with specified ResourceFeatureID
    public ResourceFeatureModel getResourceFeature(int rfId) {
    	return (ResourceFeatureModel)temp.queryForObject("Select * from ResourceFeature where resFeaId = ?", new ResourceFeatureMapper(), rfId);
    }
    
    // Inserts specified ResourceFeature into ResourceFeature table
    public int insertResourceFeature(ResourceFeatureModel rf) {
    	return temp.update("insert into ResourceFeature values(?,?,?,?,?,1)",
    			new ResourceFeatureDAO().getNextAvailableKey(), rf.getFeaId(), rf.getLocResId(), rf.getQuantity(), rf.getDescription());
    }
    
    public int insertResourceFeatureWith(int feaId, int resId, int quantity, String description) {
    	int locResId = (int)temp.queryForObject("select locResId from LocationResource where resId = ?", Integer.class, resId);
    	return temp.update("insert into ResourceFeature values(?,?,?,?,?,1)",
    			new ResourceFeatureDAO().getNextAvailableKey(), feaId, locResId, quantity, description);
    }
    
    // Updates isActive column entry to 0 to the specified ResourceFeature from ResourceFeature table
    public int deleteResourceFeature(ResourceFeatureModel rf) {
    	return temp.update("update ResourceFeature set isActive = 0 where resFeaId = ?", rf.getResFeaId());
    }
	
    // Updates specified ResourceFeature from ResourceFeature table
    public int updateResourceFeature(ResourceFeatureModel rf) {
    	return temp.update("update ResourceFeature set feaId = ?, locResId = ?, quantity = ?, description = ? where resFeaId = ?",
    			rf.getFeaId(), rf.getLocResId(), rf.getQuantity(), rf.getDescription(), rf.getResFeaId());
    }
    
    // Given featureID and resourceID, return ResourceFeatureModel
    public List<ResourceFeatureModel> getResourceFeatureWithFeaId(int feaId, int resId) {
    	return temp.query("select rf.resFeaId, rf.feaId, rf.locResId, rf.quantity, rf.description, rf.isActive "
    			+ "from ResourceFeature rf join LocationResource lr on rf.locResId = lr.locResId "
    			+ "where rf.feaId = ? and lr.resId = ?",new ResourceFeatureMapper(), feaId, resId);
    }
    
    public List<ResourceFeatureModel> getResourceFeatureWithResId(int resId) {
    	return temp.query("select rf.resFeaId, rf.feaId, rf.locResId, rf.quantity, rf.description, rf.isActive "
    			+ "from ResourceFeature rf join LocationResource lr on rf.locResId = lr.locResId "
    			+ "where lr.resId = ?",new ResourceFeatureMapper(), resId);
    }

    // Returns a list of ResourceFeatureModel from ResourceFeature table
    public List<ResourceFeatureModel> getAllResourceFeatures() {
    	return temp.query("select * from ResourceFeature", new ResourceFeatureMapper());
    }
    
    /*
    public static void main (String args[]) {
    	new ResourceFeatureDAO().insertResourceFeatureWith(3, 10,14,"IDK");
    	
    	List<ResourceFeatureModel> list = new ResourceFeatureDAO().getAllResourceFeatures();
    	for(ResourceFeatureModel rf : list) {

    	System.out.println(rf.toString());

    	}
    }
    */
	
}
