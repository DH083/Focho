package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TagDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TagDaoImpl implements TagDao {
    @Autowired
    DataSource ds;

    @Autowired
    TagDao tagDao;

    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.tagMapper.";

    @Override
    public List<TagDto> selectAll() throws SQLException {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public TagDto selectTag(int num) throws Exception {
        return session.selectOne(namespace+"select" , num);
    }
}
