package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


import model.ResourceTypeModel;

public class ResourceTypeMapper implements RowMapper<ResourceTypeModel> {
    public ResourceTypeModel mapRow(ResultSet results, int row) throws SQLException {
        ResourceTypeModel model =  new ResourceTypeModel();
        model.setID(results.getInt(1));
        model.setName(results.getString(2));
        model.setIconName(results.getString(3));
        model.setDescription(results.getString(4));
        return model;
    }
}