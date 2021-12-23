package com.mozzle.web.service.users;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
	@Autowired
	private JavaMailSender mailSender;

    //인증코드 난수 발생
    public String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;
        
        while(buffer.length() < 6) {
            num = random.nextInt(10);
            buffer.append(num);
        }
        System.out.println(buffer.toString());
        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getAuthCode();

        //인증메일 보내기
        
        String setFrom = "dlwhdvy123@gmail.com";
		
		// 메일을 보내주는 객체 MimeMessage
		MimeMessage message = mailSender.createMimeMessage();
		
		// MimeMessage는 파일 첨부, 텍스트/html 여부, encoding
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, false, "UTF-8");
			
			messageHelper.setFrom(setFrom); // 보내는 사람의 주소(필수)
			messageHelper.setTo(email); // 받는 사람의 이메일 주소
			messageHelper.setSubject("Mozzle 인증 메일"); // 메일의 제목, 생략 가능
			messageHelper.setText("인증 번호는 [" + authKey + "]입니다.", false); // 글자의 형태(true: html, false: text)
			
			// 첨부파일 MimeMessageHelper(message, true, "UTF-8") 두번째 Argument의 값이 true인 경우 multi-part로 처리됨
			// FileSystemResource fileResource = new FileSystemResource("C:/Users/qkrek/Desktop/피카츄.png");
			// messageHelper.addAttachment("피카츄.png", fileResource);
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}

        return authKey;
    }
}
