<%-- 
    Document   : Email
    Created on : 24-ene-2019, 15:32:35
    Author     : YILMER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   String result;
   // 收件人的电子邮件
   String to = "yilmer19961031@gmail.com";

   // 发件人的电子邮件
   String from = "remliysoftware@gmail.com";

   // 假设你是从本地主机发送电子邮件
   String host = "mail.HOST.net";

   // 获取系统属性对象
   Properties properties = System.getProperties();
   properties.setProperty("mail.user", "remliysoftware@gmail.com");
   properties.setProperty("mail.password", "remliy12");
   properties.setProperty("mail.smtp.starttls.enable", "true"); // El mail usa STARTTLS
	properties.setProperty("mail.smtp.port", "25");
	properties.setProperty("mail.smtp.host", "smtp.HOST.com");
	properties.setProperty("mail.smtp.auth", "true");
	properties.setProperty("mail.HOST.net", host);
   // 设置邮件服务器
  // properties.setProperty("mail.smtp.host", host);
   
   // 获取默认的Session对象。
   Session mailSession = Session.getDefaultInstance(properties);

   try{
      // 创建一个默认的MimeMessage对象。
      MimeMessage message = new MimeMessage(mailSession);
      // 设置 From: 头部的header字段
      message.setFrom(new InternetAddress(from));
      // 设置 To: 头部的header字段
      
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // 设置 Subject: header字段
      message.setSubject("This is the Subject Line!");
      // 现在设置的实际消息
      message.setText("This is actual message");
      // 发送消息
      Transport.send(message);
      result = "Sent message successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>
<!DOCTYPE html>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>
