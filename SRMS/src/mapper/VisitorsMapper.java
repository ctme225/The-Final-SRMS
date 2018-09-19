package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.VisitorsModel;

public class VisitorsMapper implements RowMapper<VisitorsModel> {

	@Override
	public VisitorsModel mapRow(ResultSet result, int arg1) throws SQLException {
		VisitorsModel visitor = new VisitorsModel();
		visitor.setVisId(result.getInt("VISID"));
		visitor.setVisName(result.getString("VISNAME"));
		visitor.setVisEmail(result.getString("VISEMAIL"));
		visitor.setVisPhone(result.getString("VISPHONE"));
		visitor.setBadgeId(result.getInt("BADGEID"));
		visitor.setVisPurpose(result.getString("VISPURPOSE"));
		visitor.setVisCompany(result.getString("VISCOMPANY"));
		visitor.setCheckIn(result.getTimestamp("CHECKIN"));
		visitor.setCheckOut(result.getTimestamp("CHECKOUT"));
		visitor.setIsActive(result.getInt("ISACTIVE"));
		return visitor;
	}

}
