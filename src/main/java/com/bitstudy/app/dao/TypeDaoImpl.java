package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TagDto;
import com.bitstudy.app.domain.TypeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TypeDaoImpl implements TypeDao {
    @Autowired
    DataSource ds;

    @Autowired
    TypeDao typeDao;

    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.typeMapper.";

    @Override
    public List<TypeDto> selectAll() throws SQLException {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public TypeDto selectType(int num) throws Exception {
        return session.selectOne(namespace+"select" , num);
    }
}
