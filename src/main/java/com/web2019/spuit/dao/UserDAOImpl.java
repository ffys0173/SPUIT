package com.web2019.spuit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.dto.UserVO;
 
@Repository
public class UserDAOImpl implements UserDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.web2019.spuit.mapper.userMapper";
    
    @Override
    public List<UserVO> selectUser() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectUser");
    }
    
    @Override
    public String loginCheck(UserVO user) throws Exception {
    	
    	return sqlSession.selectOne(Namespace + ".loginCheck", user);
    }
    
    @Override
    public SessionVO getSessionInfo(UserVO user) throws Exception {
    	
    	return sqlSession.selectOne(Namespace + ".getSessionInfo", user);
    }
    
    @Override
    public int registUser(UserVO user) {
    	
    	try {
    		
    		sqlSession.insert(Namespace + ".registUser", user);
    		return 1;
    	}
    	catch(Exception e) {
    		
    		return 0;
    	}
    }

	@Override
	public int userLeave(UserVO user) {
		
		sqlSession.delete(Namespace+".leaveUser", user);
		
		return 1;
	}
 
}