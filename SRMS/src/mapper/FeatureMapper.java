package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.*;

public class FeatureMapper implements RowMapper<FeatureModel> {
	public FeatureModel mapRow(ResultSet results, int row) throws SQLException {
		FeatureModel model = new FeatureModel();
		model.setFeaId(results.getInt("FEAID"));
		model.setFeaType(results.getString("FEATYPE"));
		model.setDescription(results.getString("DESCRIPTION"));
		model.setIconPath(results.getString("ICONPATH"));
		model.setIsActive(results.getInt("ISACTIVE"));
		return model;
	}
}
