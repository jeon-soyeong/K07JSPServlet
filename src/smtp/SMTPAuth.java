package smtp;

import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.corba.se.impl.protocol.MinimalServantCacheLocalCRDImpl;

public class SMTPAuth extends Authenticator{
	
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("", "");
	}
	
	public boolean emailSending(Map<String, String> map) {
		
		//메일발송 성공 플레그
		boolean sendOk = false;
		
		//정보를 담을 객체
		Properties p = new Properties();
		
		// SMTP 서버에 접속하기 위한 정보들
		p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP	 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuth();
			Session ses =  Session.getInstance(p, auth);
			
			ses.setDebug(true);
			
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(map.get("subject"));
			
			Address fromAddr = new InternetAddress(map.get("from"));
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(map.get("to"));
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(map.get("content"), "text/html;charset=UTF-8");
			
			Transport.send(msg);
			sendOk = true;
		} catch (Exception e) {
			sendOk = false;
			e.printStackTrace();
		}
		return sendOk;
	}
}
