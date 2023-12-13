package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewDto;
import com.bitstudy.app.domain.UserDto;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDao {
    String namespace="com.bitstudy.app.dao.reviewMapper.";

    ReviewDto selectReview(int num) throws Exception;

    void deleteAll() throws SQLException;

    int deleteReview(int num, int user_num) throws SQLException;


    int insertReview(ReviewDto reviewDto);

    List<ReviewDto> selectRes(Integer num);

    List<ReviewDto> selectUser(Integer num);

    int updateReview(ReviewDto reviewDto) throws Exception;

    int deleteReview(int num) throws SQLException;
}
