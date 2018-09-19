package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.LocationResourceModel;

public class LocationResourceMapper implements RowMapper<LocationResourceModel> {
    public LocationResourceModel mapRow(ResultSet results, int row) throws SQLException {
        LocationResourceModel model =  new LocationResourceModel();
        model.setID(results.getInt(1));
        model.setResourceID(results.getInt(2));
        model.setLocationID(results.getInt(3));
        model.setDescription(results.getString(4));
        model.setIsActive(results.getInt(5));
        return model;
    }
}