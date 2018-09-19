package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.UsersModel;


public class UserMapper implements RowMapper<UsersModel> {

	@Override
	public UsersModel mapRow(ResultSet result, int arg1) throws SQLException {
		UsersModel user = new UsersModel();
		user.setUserId(result.getInt("USERID"));
		user.setLocId(result.getInt("LOCID"));
		user.setUserName(result.getString("USERNAME"));
		user.setUserEmail(result.getString("USEREMAIL"));
		user.setUserPassword(result.getString("USERPASSWORD"));
		user.setUserType(result.getString("USERTYPE"));
		user.setUserPhone(result.getString("USERPHONE"));
		user.setName(result.getString("NAME"));
		user.setIsActive(result.getInt("ISACTIVE"));
		return user;
	}

}
