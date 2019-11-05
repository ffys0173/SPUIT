package com.web2019.spuit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
    public void registUser(UserVO user) throws Exception {
    	
    	sqlSession.insert(Namespace+".registUser", user);
    }
 
}