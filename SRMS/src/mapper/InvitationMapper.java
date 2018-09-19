package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.InvitationModel;

public class InvitationMapper implements RowMapper<InvitationModel> {
    public InvitationModel mapRow(ResultSet results, int row) throws SQLException {
        InvitationModel model =  new InvitationModel();
        model.setID(results.getInt(1));
        model.setUserID(results.getInt(2));
        model.setBookingID(results.getInt(3));
        model.setStatus(results.getString(4));
        model.setVisitorID(results.getInt(5));
        model.setDescription(results.getString(6));
        return model;
    }
}