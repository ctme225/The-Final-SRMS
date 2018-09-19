package services;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.EmailModel;
 
public class Invite {
	
	//sending email
	final String uname = "syntelsrms@gmail.com";
	final String pwd = "Syntel123$";
	
	public void sendEmail(EmailModel emailContent, String destnmailid) {  
      
		//login information for sending email
		final String uname = "syntelsrms@gmail.com";
		final String pwd = "Syntel123$";
      
		String smtphost = "smtp.gmail.com";
		System.out.println("Email: " + destnmailid);
		Properties propvls = new Properties();
		propvls.put("mail.smtp.auth", "true");
		propvls.put("mail.smtp.starttls.enable", "true");
		propvls.put("mail.smtp.host", smtphost);
		propvls.put("mail.smtp.port", "587");
      
		Session sessionobj = Session.getInstance(propvls,
				
			new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(uname, pwd);
            
			}
        });
 
		try {
			
			//email object instantiation
			Message messageobj = new MimeMessage(sessionobj);
			messageobj.setFrom(new InternetAddress(uname));
			messageobj.setRecipients(Message.RecipientType.TO,InternetAddress.parse(destnmailid));
			messageobj.setSubject("Booking Confirmation");
			
			//HTML formatting of email
			String rsvHTML = "<h1>Hi,</h1>";
		    rsvHTML += "<h2><font color=#E85200>Your SRMS reservation is confirmed!</h2><br>";
		    rsvHTML += "<table style='width:100%; font-size:150%;'>"
			    			+ "<tr><td>Location: "+ emailContent.getLoction() +"</td></tr>"
			    			+ "<tr><td>Resource: "+ emailContent.getResource()	+"</td></tr>"
			    			+ "<tr><td>Start Date: "+ emailContent.getStartTime() +"</td><td>End time: "+ emailContent.getEndTime() +"</td></tr>"
			    			+ "</tr></table>";
		    rsvHTML += "<br><h1>Thanks from, ";
		    rsvHTML += "<font color=#004837>Syntel SRMS-Team!</font></h1>";
    		rsvHTML += "<img "
				    		+ "src='https://images.all-free-download.com/images/graphiclarge/syntel_0_129980.jpg'"
				    		+ "style='max-width:40%;'>";
    		
    		//set HTML
    		messageobj.setContent(rsvHTML, "text/html");
    		
    		//send email
    		Transport.send(messageobj);
    		System.out.println("Your email sent successfully....");
    		
		} catch (MessagingException exp) {
			
			throw new RuntimeException(exp);
		}
	}
}