package com.web2019.spuit.dao;

import java.util.List;

import com.web2019.spuit.dto.KeywordVO;
 
public interface KeywordDAO {
    
    public List<KeywordVO> getAllKeywords();
    public void updateKeyword(KeywordVO key);
}
