package com.dende.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dende.sns.common.EncryptUtils;
import com.dende.sns.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		// password 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
		
	}
	
	// 중복인지 아닌지?
	public boolean isDuplication(String loginId) {
	
		int count = userDAO.selectCountById(loginId);
		
		if(count >= 1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
}
