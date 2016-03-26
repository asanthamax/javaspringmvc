package thilina.spring.aspects;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import thilina.spring.bean.Applicant;
import thilina.spring.dao.ApplicantDaoImpl;


@Aspect
public class NotificationAspect {

	private Log log = LogFactory.getLog(NotificationAspect.class);
	@Autowired
	private JavaMailSender javaMailSender;
	@AfterReturning("execution(* thilina.spring.service.Manager.pushCV(..)) && args(userID)")
	public void sendNotifications(JoinPoint joinPoint,String userID)
	{
		try{
			ApplicantDaoImpl app = new ApplicantDaoImpl();
			Applicant applicant = app.findById(userID);
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(applicant.getEmail());
			mail.setSubject("CV Send Notification");
			mail.setText("Your CV sent to available companies");
			javaMailSender.send(mail);
		}
		catch(Exception ex)
		{
			log.error("Error Occured :"+ex.getMessage());
		}
	}
	
	@AfterThrowing("execution(* thilina.spring.service.Manager.pushCV(..))")
	public void cvUploadError()
	{
		
	}
}
