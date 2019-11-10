package com.web2019.spuit.dao;

import java.util.List;

import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.dto.UserVO;
 
public interface UserDAO {
    
    public List<UserVO> selectUser() throws Exception;
    public SessionVO loginCheck(UserVO user) throws Exception;
    public int registUser(UserVO user) throws Exception;
}
