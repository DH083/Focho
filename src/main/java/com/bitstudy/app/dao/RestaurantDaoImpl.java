package com.bitstudy.app.dao;

import com.bitstudy.app.domain.RestaurantDto;
import com.bitstudy.app.domain.RestaurantLoginDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RestaurantDaoImpl implements RestaurantDao {

    @Autowired
    DataSource ds;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.restaurantMapper.";

    @Override
    public void deleteAll() throws SQLException {

    }

    @Override
    public int insertRes(RestaurantDto res) {
        return 0;
    }

    @Override
    public RestaurantDto selectRes(Integer num) throws Exception {
        return session.selectOne(namespace+"select" , num);
    }
    public List<RestaurantDto> selectAll(Integer num) {
        return session.selectList(namespace+"selectAll", num);
    }
    public List<RestaurantDto> selectSearch(String keyword) {
        return session.selectList(namespace+"selectSearch", keyword);
    }
    public List<RestaurantDto> selectSearchName(String keyword) {
        return session.selectList(namespace+"selectSearchName", keyword);
    }

    public List<RestaurantDto> selectTag(Integer tag) {
        return session.selectList(namespace+"selectTag", tag);
    }
    public List<RestaurantDto> selectType(Integer type) {

        return session.selectList(namespace+"selectType", type);
    }
    public List<RestaurantLoginDto> selectTypeLogin(Integer type, Integer user_num) {
        Map map = new HashMap();
        map.put("type",type);
        map.put("user_num",user_num);
        return session.selectList(namespace+"selectTypeLogin", map);
    }
    public List<RestaurantLoginDto> selectTagLogin(Integer tag, Integer user_num) {
        Map map = new HashMap();
        map.put("tag",tag);
        map.put("user_num",user_num);
        return session.selectList(namespace+"selectTagLogin", map);
    }
    public List<RestaurantLoginDto> selectSearchLogin(String keyword, Integer user_num) {
        Map map = new HashMap();
        map.put("keyword",keyword);
        map.put("user_num",user_num);
        return session.selectList(namespace+"selectSearchLogin", map);
    }
    public RestaurantLoginDto selectResLogin(Integer num, Integer user_num) {
        Map map = new HashMap();
        map.put("num",num);
        map.put("user_num",user_num);
        return session.selectOne(namespace+"selectResLogin", map);
    }
    public List<RestaurantDto> selectJjim(Integer num) {
        return session.selectList(namespace+"selectJjim", num);
    }
    @Override
    public int count() {
        return session.selectOne(namespace+"count");
    }

    @Override
    public int updateRes(RestaurantDto res) throws Exception {
        return 0;
    }

    @Override
    public int deleteRes(String id) throws SQLException {
        return 0;
    }

    public int updateReviewCount(Integer num, int count) {
        Map map = new HashMap();
        map.put("num",num);
        map.put("count",count);

        return session.update(namespace+"updateReviewCount", map);

    }

    public int updateResScore(Integer num, int score) {
        Map map = new HashMap();
        map.put("num", num);
        map.put("score", score);
        return session.update(namespace+"updateResScore", map);
    }

    public int removeReviewCount(Integer num, int count) {
        Map map = new HashMap();
        map.put("num",num);
        map.put("count",count);

        return session.update(namespace+"updateReviewCount", map);
    }
    public int removeResScore(Integer num, int score) {
        Map map = new HashMap();
        map.put("num", num);
        map.put("score", score);
        return session.update(namespace+"removeResScore", map);
    }
}
