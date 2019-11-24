package com.web2019.spuit.service;

import java.util.List;

import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.dto.UserVO;

public interface UserService {

	public List<UserVO> selectUser() throws Exception;
	public int registUser(UserVO user) throws Exception;
	public SessionVO loginCheck(UserVO user) throws Exception;
	int userLeave(UserVO user);
}
