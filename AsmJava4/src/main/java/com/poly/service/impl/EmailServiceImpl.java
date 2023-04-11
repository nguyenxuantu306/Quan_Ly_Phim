package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.util.SendMailUtil;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to PhimCuaXuanTu";
	private static final String EMAIL_FORGOT_PASSWORD = "PhimCuaXuanTu - New Password";

	@Override
	public void sendMail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");

		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome": {
				subject = "EMAIL_WELCOME_SUBJECT";
				content = "Xin chào " + recipient.getUsername() + ", chúc bạn xem phim vui vẻ ^^";
				break;
			}
			case "forgot": {
				subject = "EMAIL_FORGOT_PASSWORD";
				content = "Xin chào " + recipient.getUsername() + ", mật khẩu mới của bạn là: "
						+ recipient.getPassword();
				break;
			}
			default:
				subject = "PhimCuaXuanTu";
				content = "Có thể Email này bị lỗi, mong bạn thông cảm. Chúc bạn xem phim vui vẻ";
			}
			SendMailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
