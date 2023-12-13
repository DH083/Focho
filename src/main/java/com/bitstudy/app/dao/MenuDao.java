package com.bitstudy.app.dao;

import com.bitstudy.app.domain.MenuDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class MenuDao {

    @Autowired
    DataSource ds;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.menuMapper.";

    public List<MenuDto> selectMenu(Integer num) {
        return session.selectList(namespace + "selectMenu", num);
    }
}
