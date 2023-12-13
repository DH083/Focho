package com.bitstudy.app.dao;

import com.bitstudy.app.domain.RestaurantDto;
import com.bitstudy.app.domain.RestaurantLoginDto;

import java.sql.SQLException;
import java.util.List;

public interface RestaurantDao {
    void deleteAll() throws SQLException;

    int insertRes(RestaurantDto res);

    RestaurantDto selectRes(Integer res_num) throws Exception;

    int updateRes(RestaurantDto res) throws Exception;

    int deleteRes(String id) throws SQLException;

    List<RestaurantDto> selectAll(Integer num);

    List<RestaurantDto> selectSearch(String keyword);
    List<RestaurantDto> selectSearchName(String keyword);

    List<RestaurantDto> selectTag(Integer tag);

    List<RestaurantDto> selectType(Integer type);
    List<RestaurantLoginDto> selectTypeLogin(Integer type, Integer user_num);
    List<RestaurantLoginDto> selectTagLogin(Integer tag, Integer user_num);
    List<RestaurantLoginDto> selectSearchLogin(String keyword, Integer user_num);
    RestaurantLoginDto selectResLogin(Integer num, Integer user_num);
    List<RestaurantDto> selectJjim(Integer num);

    int count() throws Exception;

    int updateReviewCount(Integer bno, int i);
    int updateResScore(Integer bno, int score);

    int removeReviewCount(Integer bno, int i);
    int removeResScore(Integer bno, int score);
}
