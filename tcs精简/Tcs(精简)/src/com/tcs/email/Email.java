package com.tcs.email;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

	public static String sendEmailToBind(String toMail,int flag) throws Exception {
		int random = new Random().nextInt(1000000);
		String rd = String.valueOf(random);
		Properties props = new Properties(); // 可以加载一个配置文件
		// 使用smtp：简单邮件传输协议
		props.put("mail.smtp.host", "smtp.163.com");// 存储发送邮件服务器的信息
		props.put("mail.smtp.auth", "true");// 同时通过验证
		Session session = Session.getInstance(props);// 根据属性新建一个邮件会话
		// session.setDebug(true); //有他会打印一些调试信息。
		MimeMessage message = new MimeMessage(session);// 由邮件会话新建一个消息对象
		message.setFrom(new InternetAddress("17764595249@163.com"));// 设置发件人的地址
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(
				toMail));// 设置收件人,并设置其接收类型为TO
		message.setSubject("邮箱绑定认证");// 设置标题
		// 设置信件内容
		// message.setText(mailContent); //发送 纯文本 邮件 todo
		if(flag==0){
			message.setContent(getmailContent(rd), "text/html;charset=utf-8"); // 发送HTML邮件，内容样式比较丰富
		}else{
			message.setContent(getmailContentToBackPwd(rd), "text/html;charset=utf-8");
		}
		message.setSentDate(new Date());// 设置发信时间
		message.saveChanges();// 存储邮件信息
		// 发送邮件
		Transport transport = session.getTransport("smtp");
		// Transport transport = session.getTransport();
		transport.connect("17764595249@163.com", "airexue123");
		transport.sendMessage(message, message.getAllRecipients());// 发送邮件,其中第二个参数是所有已设好的收件人地址
		transport.close();
		return rd;
	}

	private static String getmailContent(String rd) {
		String content = "<h2>塔塔家政智慧社区</h2><p>绑定邮箱验证码为：</p>" + rd;
		return content;
	}
	
	private static String getmailContentToBackPwd(String rd) {
		String content = "<h2>塔塔家政智慧社区</h2><p>找回密码验证码为：</p>" + rd+"<br><p>千万不要告诉别人噢！</p>";
		return content;
	}

}
