package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.FeatureMapper;
import model.FeatureModel;
import model.ResourceModel;
import services.FeatureViewModel;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FeatureDAO {
    private JdbcTemplate temp;

    public FeatureDAO(){
        temp = Connection.getConnection();
    }
    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(feaId) from Feature",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    // Return FeatureModel with specified featureID
    public FeatureModel getFeature(int feaId) {
    	return (FeatureModel)temp.queryForObject("Select * from Feature where feaId = ?", new FeatureMapper(), feaId);
    }
    
    // Inserts specified user into Users table
    public int insertFeature(FeatureModel feature) {
    	return temp.update("insert into Feature values(?,?,?,?,1)",
    			new FeatureDAO().getNextAvailableKey(), feature.getFeaType(), feature.getDescription(), feature.getIconPath());
    }
	
    // Updates isActive column entry to 0 to the specified feature from Feature table
    public int deleteFeature(FeatureModel feature) {
    	return temp.update("update Feature set isActive = 0 where feaId = ?", feature.getFeaId());
    }
	
    // Updates specified feature from Feature table
    public int updateFeature(FeatureModel feature) {
    	return temp.update("update Feature set feaType = ?, description = ?, iconPath =? where feaId = ?)",
    			feature.getFeaType(), feature.getDescription(), feature.getIconPath(), feature.getFeaId());
    }
    
    // Given resourceID and locationID, returns a list of FeatureModels with corresponding ID's
    public List<FeatureModel> getFeaturesWithResIDandLocID(int resId, int locId) {
    	return temp.query("select f.feaId, f.feaType, f.description, f.iconPath, f.isActive from Feature f join ResourceFeature rf on "
    			+ "f.feaId = rf.feaId join LocationResource lr on rf.locResId = lr.locResId where lr.resId = ? and lr.locId = ?",
    			new FeatureMapper(), resId, locId);
    }
    
    // Returns a list of FeatureModel from Feature table
    public List<FeatureModel> getAllFeatures() {
    	return temp.query("select * from Feature", new FeatureMapper());
    }

    public Map<Integer,List<FeatureViewModel>> getFeatureMap(List<ResourceModel> rm)
    {
        Map<Integer,List<FeatureViewModel>> mrm = new HashMap<>();

        for(ResourceModel i:rm)
        {
            List<Map<String, Object>> rows = temp.queryForList("select f.FEATYPE as name, f.ICONPATH as img,rf.QUANTITY as cnt from FEATURE f join RESOURCEFEATURE RF on " +
                    "f.FEAID = RF.FEAID join LOCATIONRESOURCE L on RF.LOCRESID = L.LOCRESID where L.RESID = ?",i.getResId());
            List<FeatureViewModel> models = new ArrayList<>();
            for(Map row: rows)
            {
                FeatureViewModel model = new FeatureViewModel();
                model.setImg((String)row.get("img"));
                model.setCount(((BigDecimal)row.get("cnt")).intValue());
                model.setName((String)row.get("name"));
                models.add(model);
            }
            mrm.put(i.getResId(),models);
        }
        return mrm;
    }
}
