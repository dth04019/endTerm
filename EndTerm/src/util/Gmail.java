package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//관리자 아이디와 비밀번호 넣어주기(E-mail)
		return new PasswordAuthentication("htt0099@gmail.com", "dlwoghdRj00");
	}
	
}
