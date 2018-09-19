package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.*;

public class ResourceFeatureMapper implements RowMapper<ResourceFeatureModel> {
	public ResourceFeatureModel mapRow(ResultSet results, int row) throws SQLException {
		ResourceFeatureModel model = new ResourceFeatureModel();
		model.setResFeaId(results.getInt("RESFEAID"));
		model.setFeaId(results.getInt("FEAID"));
		model.setLocResId(results.getInt("LOCRESID"));
		model.setQuantity(results.getInt("QUANTITY"));
		model.setDescription(results.getString("DESCRIPTION"));
		model.setIsActive(results.getInt("ISACTIVE"));
		return model;
	}
	
}
