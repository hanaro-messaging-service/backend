package email;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// 네이버 SMTP 서버를 통해 이메일을 전송하는 클래스
public class emailSMTP {
    private final Properties serverInfo; // 서버 정보
    private final Authenticator auth;    // 인증 정보

    public emailSMTP() {
        // 네이버 SMTP 서버 접속 정보


        serverInfo = new Properties();
        serverInfo.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        serverInfo.put("mail.smtp.host", "smtp.naver.com");
        serverInfo.put("mail.smtp.port", "465");
        serverInfo.put("mail.smtp.starttls.enable", "true");
        serverInfo.put("mail.smtp.auth", "true");
        serverInfo.put("mail.smtp.debug", "true");

        serverInfo.put("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
        serverInfo.put("jdk.tls.client.protocols", "TLSv1.2");
        serverInfo.put("mail.smtp.socketFactory.port", "465");
        serverInfo.put("mail.smtp.ssl.enable","true");
        serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
        serverInfo.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        serverInfo.put("mail.smtp.socketFactory.fallback", "false");

        // 사용자 인증 정보
        auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qudtjr1116", "qudtjr484541!");
            }
        };
    }

    // 주어진 메일 내용을 네이버 SMTP 서버를 통해 전송합니다.
    public void emailSending(Map<String, String> mailInfo, Map<String,String[]> toInfo) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.ssl.enable", "true");

// 이메일 전송에 필요한 다른 속성들을 추가로 설정

        Session.getInstance(props);
        System.setProperty("jdk.tls.client.protocols", "TLSv1.2");
        System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
        // 1. 세션 생성
        Session session = Session.getInstance(serverInfo, auth);
        session.setDebug(true);

        // 2. 메시지 작성
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(mailInfo.get("from")));     // 보내는 사람

        String[] addr = toInfo.get("to");
        InternetAddress[] toAddr = new InternetAddress[addr.length];
        for(int i = 0; i < addr.length; i++) {
            toAddr[i] = new InternetAddress(addr[i]);
        }
        msg.addRecipients(Message.RecipientType.TO,
                toAddr);  // 받는 사람
        msg.setSubject(mailInfo.get("subject"));                    // 제목
        msg.setContent(mailInfo.get("content"), mailInfo.get("format"));  // 내용

        // 3. 전송
        Transport.send(msg);
    }
}