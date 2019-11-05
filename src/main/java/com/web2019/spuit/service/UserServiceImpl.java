package com.web2019.spuit.service;

import java.util.List;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
 
import com.web2019.spuit.dao.UserDAO;
import com.web2019.spuit.dto.UserVO;
 
@Service
public class UserServiceImpl implements UserService {
 
    @Inject
    private UserDAO dao;
    
    @Override
    public List<UserVO> selectUser() throws Exception {
 
        return dao.selectUser();
    }
    
    @Override
    public void registUser(UserVO user) throws Exception {
    	
    	dao.registUser(user);
    }
 
}
