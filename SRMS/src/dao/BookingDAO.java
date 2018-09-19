package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import model.BookingModel;
import model.BookingRangeModel;
import mapper.BookingMapper;
import mapper.BookingRangeMapper;
import mapper.ResourceMapper;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BookingDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;
    
    public BookingDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jt");
    }
    
    // Return BookingModel with specified bookingID
    public BookingModel getBooking(int bId) {
    	return (BookingModel)temp.queryForObject("Select * from Booking where bookingId = ?", new BookingMapper(), bId);
    }
    
    // Inserts specified Booking into Booking table
    public int insertBooking(BookingModel book,String start,String end) {
    	return temp.update("insert into Booking values(seq_booking.NEXTVAL,?,?,to_timestamp(?,'MM-DD-YYYY HH24:MI'),to_timestamp(?,'MM-DD-YYYY HH24:MI'),?,1)",
    			book.getLocResID(), book.getUserID(), start, end, book.getDescription());
    }
	
    // Updates isActive column entry to 0 to the specified Booking from Booking table
    public int deleteBooking(int book) {
    	return temp.update("update Booking set isActive = 0 where bookingId = ?", book);
    }
	
    // Updates specified Booking from Booking table
    public int updateBooking(BookingModel book) {
    	return temp.update("update Booking set locResId = ?, userId = ?, startTime = ?, "
    			+ "endTime = ?, description = ? where bookingId = ?",
    			book.getLocResID(), book.getUserID(), book.getStartTime(), 
    			book.getEndTime(), book.getDescription(), book.getID());
    }

    // Returns a list of BookingModels from Booking table
    public List<BookingModel> getAllBookings() {
    	return temp.query("select * from Booking where isActive = 1", new BookingMapper());
    }
    
    // Given date range, return list of bookings overlapping with that range
    public List<BookingModel> getBookingsWithDateRange(String sTime, String eTime) {
    	//String i = "select count(*) from bookings where starttime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy')";
    	//String i = "select * from Booking where (starttime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy')) or (endtime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy'))";
    	//BookingModel bm = (BookingModel)temp.queryForObject("select * from booking where bookingid = ?", new BookingMapper(),69);
    	
    	
    	return temp.query("select * from booking where (starttime between ? and ?) or (endtime between ? and ?)" 
    			,new BookingMapper(),
    			sTime,eTime,sTime,eTime);
    }
    
    public List<BookingModel> getBookingsForCurrentDate() {
    	return temp.query("select * from Booking where (sysdate between startTime and endTime) or (sysdate < startTime)", new BookingMapper());
    }
    
    // list of booked bookings given time and locResID
    // list of booked bookings given time and locID and resID
    public List<BookingRangeModel> getBookingRange(int locId, int resId, String sTime, String eTime) {
        return temp.query("select startTime, endTime from booking where "
                        + "((startTime between ? and ?) or (endTime between ? and ?)) "
                        + "and locResId in "
                        + "(select locResId from LocationResource where locId = ? and resId = ?)",
                new BookingRangeMapper(), sTime, eTime, sTime, eTime, locId, resId);
    }



//    public List<ChartData> getNumberBookingPerDay()
//    {
//        List<ChartData> data = new ArrayList<>();
//        List<Map<String, Object>> rows = temp.queryForList("SELECT Trunc(starttime) as dt,COUNT(*) as cnt FROM BOOKING GROUP BY STARTTIME");
//        for (Map row: rows) {
//            ChartData temp = new ChartData();
//            temp.setNumDays(((BigDecimal)row.get("cnt")).intValue());
//            temp.setDateTime(((Timestamp)row.get("dt")).toLocalDateTime().toLocalDate().toString());
//            data.add(temp);
//        }
//        return data;
//    }
    public List<ChartData> getNumberBookingPerDay(int location)
    {
        String[] dates = {"6/2018","8/2018"};
        List<ChartData> data = new ArrayList<>();
        List<Map<String, Object>> rows = temp.queryForList("select rt.retname as \"Room Type\" ," +
                "Round(sum(timestamp_diff(b.endtime,b.starttime)/60/60/8),2)as \"Days Booked\" from " +
                "locationresource lr join booking b on " +
                "lr.locresid = b.locresid join resources r on lr.resid=r.resid " +
                "join resourcetype rt on rt.retid=r.restype where lr.locid = ? " +
                "group by rt.retname",location);
        for (Map row: rows) {
            ChartData temp = new ChartData();
            temp.setNumDays(((BigDecimal)row.get("Days Booked")).doubleValue());
            String i = (String)(row.get("Room Type"));
            i.replace("'","");
            temp.setTitle(i);

            data.add(temp);
        }

        return data;
    }

    public List<ChartData> getNumberBookingByResourceType(String resourceType)
    {
        List<ChartData> data = new ArrayList<>();

        List<Map<String, Object>> rows = temp.queryForList("select r.resname as \"Room Name\",Round((timestamp_diff(b.endtime,b.starttime)/60/60/8),2)as \"Days Booked\" from booking b join locationresource lr on lr.locresid = b.locresid join resources r on lr.resid=r.resid\n" +
                "join resourcetype rt on rt.retid=r.restype  where lr.locid=1 and extract(year from b.starttime)=2018 and extract(month from b.starttime)=6 and rt.retname like ?",resourceType);
        for (Map row: rows) {
            ChartData temp = new ChartData();
            temp.setNumDays(((BigDecimal)row.get("Days Booked")).doubleValue());
            temp.setTitle((String)(row.get("Room Name")));
            data.add(temp);
        }

        return data;
    }
    
 // Updates specified Booking from Booking table
    public int updateBooking(BookingModel book, String sTime, String eTime) {
    	return temp.update("update Booking set startTime = to_timestamp(?,'MM-DD-YYYY HH24:MI'),"
    			+ "endTime = to_timestamp(?,'MM-DD-YYYY HH24:MI'), description = ? where bookingId = ?",
    			sTime, eTime, book.getDescription(), book.getID());
    }
    
}
