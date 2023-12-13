package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao {

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.reviewMapper."; /* 주의: 마지막에 . 있음 */

    @Override
    public ReviewDto selectReview(int num) throws SQLException {
        return session.selectOne(namespace+"select", num);
    }

    @Override
    public void deleteAll() throws SQLException {

    }

    @Override
    public int deleteReview(int num, int user_num) {
        Map map = new HashMap();
        map.put("num",num);
        map.put("user_num",user_num);

        return session.delete(namespace+"deleteReview" , map);
    }

    @Override
    public int insertReview(ReviewDto reviewDto) {
        return session.insert(namespace+"insertReview", reviewDto);
    }

    @Override
    public List<ReviewDto> selectRes(Integer num) {
        return session.selectList(namespace+"selectRes", num);
    }

    @Override
    public List<ReviewDto> selectUser(Integer num) {
        return session.selectList(namespace+"selectUser", num);
    }

    @Override
    public int updateReview(ReviewDto reviewDto) throws Exception {
        return 0;
    }

    @Override
    public int deleteReview(int num) throws SQLException {
        return 0;
    }
}
