package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//������ ���̵�� ��й�ȣ �־��ֱ�(E-mail)
		return new PasswordAuthentication("htt0099@gmail.com", "dlwoghdRj00");
	}
	
}
