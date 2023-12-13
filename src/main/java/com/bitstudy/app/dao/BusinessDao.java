package com.bitstudy.app.dao;

import com.bitstudy.app.domain.BusinessDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BusinessDao {
    @Autowired
    DataSource ds;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.restaurantMapper.";

    public List<BusinessDto> selectTime(Integer num) {
        return session.selectList(namespace + "selectTime", num);
    }
    public BusinessDto selectTimeToday(Integer num, Integer day) {
        Map map = new HashMap();
        map.put("num", num);
        map.put("day", day);
        return session.selectOne(namespace + "selectTimeToday", map);
    }
}
