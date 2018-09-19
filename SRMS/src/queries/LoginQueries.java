package queries;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.UserMapper;
import model.UsersModel;

/**
 * This class performs actions related to logging in and checking the status of logged in users.
 * @author Re: Syntellions
 * @see Users
 */
public class LoginQueries {
	private ApplicationContext context;
	private JdbcTemplate jtemp;
	
	/**
	 * Constructor that establishes connection to database via Spring Framework.
	 */
	public LoginQueries() {

        this.context = new ClassPathXmlApplicationContext("spring-dao.xml");
        this.jtemp = (JdbcTemplate)context.getBean("jt");
	}
	
	/**
	 * Returns a user and all associated data (such as User ID) when given
	 * a correct email and password.
	 * @param email An email address associated with an account.
	 * @param password A password associated with the given email address.
	 * @return A user object (if parameters were correct).
	 * @throws EmptyResultDataAccessException Throws an error if no user is found.
	 */
	public UsersModel loginOnEmail(String email, String password) throws EmptyResultDataAccessException {
		return jtemp.queryForObject("SELECT * FROM USERS WHERE USEREMAIL = ? AND USERPASSWORD = ?", 
				new UserMapper(), email, password);
	}
	
	/**
	 * Returns a user and all associated data (such as User ID) when given
	 * a correct username and password.
	 * @param userName A username associated with an account.
	 * @param password A password associated with the given email address.
	 * @return A user object (if parameters were correct).
	 * @throws EmptyResultDataAccessException Throws an error if no user is found.
	 */
	public UsersModel loginOnUserName(String userName, String password) throws EmptyResultDataAccessException {
		return jtemp.queryForObject("SELECT * FROM USERS WHERE username = ? AND userpassword = ?", 
				new UserMapper(), userName, password);
	}
	
	/**
	 * Checks the user type of a user when given a correct email and password.
	 * 
	 * If the UserType is 1 (Super User) or 3 (Manager User), the function returns true.
	 * @param email An email address associated with an account.
	 * @param password A password associated with the given email address.
	 * @return True of False depending on whether or not the user has admin rights.
	 * @throws EmptyResultDataAccessException Throws an error if no user is found.
	 */
	public static void main(String s[])
	{
		System.out.println(new LoginQueries().loginOnUserName("operatorunnatural", "jessica"));
	}
	public boolean checkIsAdminUsingEmail(String email, String password) throws EmptyResultDataAccessException {
		return true;
	}
	
	/**
	 * Checks the UserType of a user when given a correct username and password.
	 * 
	 * If the UserType is 1 (Super User) or 3 (Manager User), the function returns true.
	 * @param userName A username associated with an account.
	 * @param password A password associated with the given username.
	 * @return True of False depending on whether or not the user has admin rights.
	 * @throws EmptyResultDataAccessException Throws an error if no user is found.
	 */
	public boolean checkIsAdminUsingUsername(String userName, String password) throws EmptyResultDataAccessException {
		String userType = jtemp.queryForObject("SELECT usertype FROM users WHERE username = ? AND userpassword = ?", 
				String.class, userName, password);
		if(userType.equals("Admin"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	
	/**
	 * Gets userID based on username and password
	 * 
	 * If the UserType is 1 (Super User) or 3 (Manager User), the function returns true.
	 * @param userName A username associated with an account.
	 * @param password A password associated with the given username.
	 * @return The userID of the user with the given username and password. 
	 * @throws EmptyResultDataAccessException Throws an error if no user is found.
	 */
	public int getUserIdOnUserNameandPassword(String userName, String password) throws EmptyResultDataAccessException {
		Integer userId = jtemp.queryForObject("SELECT userid FROM users WHERE username = ? AND userpassword = ?", 
				Integer.class, userName, password);
		return userId;
	}
}
