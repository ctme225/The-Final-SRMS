package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.LocationModel;

public class LocationMapper implements RowMapper<LocationModel> {

	@Override
	public LocationModel mapRow(ResultSet result, int arg1) throws SQLException {
		LocationModel visitor = new LocationModel();
		visitor.setLocId(result.getInt("LOCID"));
		visitor.setLocName(result.getString("LOCNAME"));
		visitor.setLocCity(result.getString("LOCCITY"));
		visitor.setLocState(result.getString("LOCSTATE"));
		visitor.setLocAddress(result.getString("LOCADDRESS"));
		visitor.setDescription(result.getString("DESCRIPTION"));
		visitor.setIsActive(result.getInt("ISACTIVE"));
		return visitor;
	}

}
