package dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationMapper;
import mapper.UserMapper;
import model.LocationModel;
import model.UserModel;
//import model.UserModel;
import model.UsersModel;


public class UserDAO {

	 ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	 JdbcTemplate jtemp = (JdbcTemplate)context.getBean("jt");
	
	
	// Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)jtemp.queryForObject("select MAX(userId) from Users",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    public UsersModel getUser(int id) {
		return (UsersModel)jtemp.queryForObject("select * from users where userid = ?", new UserMapper(),id);
	}
    
    // Return correct password for specified user
    public String getPasswordForUser(UsersModel user) {
    	UsersModel userRet = (UsersModel)jtemp.queryForObject("Select * from Users where userId = ?", new UserMapper(), user.getUserId());
    	return userRet.getUserPassword();
    }
    
    // Inserts specified user into Users table
    public int insertUser(UsersModel user) {
    	return jtemp.update("insert into Users values(?,?,?,?,?,?,?,?,1)",
    			new UserDAO().getNextAvailableKey(), user.getUserName(), user.getUserEmail(), user.getUserPassword(),
    			user.getUserType(), user.getUserPhone(), user.getLocId(),user.getName());
    }
	
    // Updates isActive column entry to 0 to the specified user from Users table
    public int deleteUser(UsersModel user) {
    	return jtemp.update("update Users set isActive = 0 where userId = ?)", user.getUserId());
    }
	
    // Updates specified user from Users table
    public int updateUser(UsersModel user) {
    	return jtemp.update("update Users set userPassword = ?, locId = ?, userType =? where userId = ?)",
    			user.getUserPassword(), user.getLocId(), user.getUserType(), user.getUserId());
    }
    public LocationModel getUserLocation(int userid) {
        UsersModel user = (UsersModel)jtemp.queryForObject("select * from users where userid = ?", new UserMapper(),userid);
        LocationModel location = (LocationModel)jtemp.queryForObject("select * from location where locid = ?",new LocationMapper(), user.getLocId());
        return location;
    }
    public List<UsersModel> getAllUsers() {
    	return jtemp.query("select * from Users", new UserMapper());
    }
    
    public int updateUser(UserModel user) {
        return jtemp.update("update Users set username = ?, useremail = ?, userPassword = ?, "
                + "userphone = ?, locId = ? where userId = ?",
                user.getUserName(), user.getUserEmail(), user.getUserPassword(),
                user.getUserPhone(), user.getLocId(), user.getUserId());
    }
    /*
    public UsersModel get(int ID)
    {
        return new UsersModel();
    }
    */
}
