package com.bitstudy.app.service;

import com.bitstudy.app.dao.RestaurantDao;
import com.bitstudy.app.dao.RestaurantDaoImpl;
import com.bitstudy.app.dao.ReviewDao;
import com.bitstudy.app.dao.ReviewDaoImpl;
import com.bitstudy.app.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Service
public class ReviewService {

    @Autowired
    ReviewDao reviewDao;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.reviewMapper.";

    @Transactional(rollbackFor = Exception.class)
    public int addReview(ReviewDto reviewDto, int num) {
        int score = reviewDto.getScore();
        restaurantDao.updateReviewCount(num, 1);
        restaurantDao.updateResScore(num, score);
        return reviewDao.insertReview(reviewDto);
    }

    @Transactional(rollbackFor = Exception.class)
    public int removeReview(Integer bno, Integer cno, Integer user_num, Integer score) throws SQLException {
        restaurantDao.removeReviewCount(bno, -1);
        restaurantDao.removeResScore(bno, score);
        return reviewDao.deleteReview(cno, user_num);
    }



    @Transactional(rollbackFor = Exception.class)
    public int selectSearch(Integer bno, Integer cno, Integer user_num) throws SQLException {
        // board 테이블에 있는 댓글수 -1 하기
        restaurantDao.removeReviewCount(bno, -1);
        return reviewDao.deleteReview(cno, user_num);
    }
}
