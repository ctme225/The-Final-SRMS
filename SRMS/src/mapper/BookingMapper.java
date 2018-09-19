package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.BookingModel;

public class BookingMapper implements RowMapper<BookingModel> {
    public BookingModel mapRow(ResultSet results, int row) throws SQLException {
        BookingModel model =  new BookingModel();
        model.setID(results.getInt(1));
        model.setLocResID(results.getInt(2));
        model.setUserID(results.getInt(3));
        model.setStartTime(results.getTimestamp(4));
        model.setEndTime(results.getTimestamp(5));
        model.setDescription(results.getString(6).replace("'", ""));
        return model;
    }
}