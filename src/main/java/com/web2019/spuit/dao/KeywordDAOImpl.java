package com.web2019.spuit.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web2019.spuit.dto.KeywordVO;

@Repository
public class KeywordDAOImpl implements KeywordDAO {
	
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.web2019.spuit.mapper.keywordMapper";

	@Override
	public List<KeywordVO> getAllKeywords() {
		
		return sqlSession.selectList(Namespace + ".selectAllKeywords");
	}

	@Override
	public void updateKeyword(KeywordVO key) {
		
		sqlSession.insert(Namespace + ".IncreaseValue", key);
	}

}
