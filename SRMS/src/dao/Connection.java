package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public final class Connection {
	private static JdbcTemplate temp;
	public static JdbcTemplate getConnection()
	{
		if(temp ==  null)
		{
	        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml"); 
	        temp = (JdbcTemplate) context.getBean("jt");
		}
		return temp;
			
	}
	
}
