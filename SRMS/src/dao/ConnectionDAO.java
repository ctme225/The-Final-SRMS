package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class ConnectionDAO {
	
	public static JdbcTemplate getTemplate() {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        JdbcTemplate temp = (JdbcTemplate) context.getBean("jt");
        return temp;
	}

}
