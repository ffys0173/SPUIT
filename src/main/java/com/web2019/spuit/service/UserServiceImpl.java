package com.web2019.spuit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
 
import com.web2019.spuit.dao.UserDAO;
import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.dto.UserVO;
 
@Service
public class UserServiceImpl implements UserService {
 
    @Inject
    private UserDAO dao;
    
    @Inject
    private BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public List<UserVO> selectUser() throws Exception {
 
        return dao.selectUser();
    }
    
    @Override
    public int registUser(UserVO user) throws Exception {
    	
    	String encrypted = passwordEncoder.encode(user.getPw());
    	user.setPw(encrypted);
    	
    	int result = dao.registUser(user);
    	
    	return result;
    }
    
    @Override
    public SessionVO loginCheck(UserVO user) throws Exception {
    	
    	if(passwordEncoder.matches(user.getPw(), dao.loginCheck(user))) {
    		
    		return dao.getSessionInfo(user);
    	}
    	else {
    		
    		return null;
    	}
    }
    
    @Override
    public int userLeave(UserVO user) {
    	
    	return dao.userLeave(user);
    }
 
}
