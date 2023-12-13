package com.bitstudy.app.service;

import com.bitstudy.app.dao.RestaurantDao;
import com.bitstudy.app.dao.ReviewDao;
import com.bitstudy.app.domain.MenuDto;
import com.bitstudy.app.domain.RestaurantDto;
import com.bitstudy.app.domain.RestaurantLoginDto;
import com.bitstudy.app.domain.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

@Service
public class RestaurantService {

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    ReviewDao reviewDao;

    // 레스토랑 리스트
    // 가게 번호로 가져오기
    public List<RestaurantDto> getList(Integer num) throws Exception {
        return restaurantDao.selectAll(num);
    }

    // 가게 태그로 가져오기
    public List<RestaurantDto> getListTag(Integer tag) throws Exception {
        return restaurantDao.selectTag(tag);
    }

    // 가게 분류로 가져오기
    public List<RestaurantDto> getListType(Integer type) throws Exception {
        return restaurantDao.selectType(type);
    }

    // 가게 분류로 가져오기/로그인 후
    public List<RestaurantLoginDto> getListTypeLogin(Integer type, Integer user_num) throws Exception {
        return restaurantDao.selectTypeLogin(type, user_num);
    }

    // 가게 태그로 가져오기/로그인 후
    public List<RestaurantLoginDto> getListTagLogin(Integer tag, Integer user_num) throws Exception {
        return restaurantDao.selectTagLogin(tag, user_num);
    }

    // 가게 번호로 가져오기/로그인 후
    public RestaurantLoginDto getResLogin(Integer num, Integer user_num) throws Exception {
        return restaurantDao.selectResLogin(num, user_num);
    }

    // 가게 검색어로 가져오기/로그인 후
    public List<RestaurantLoginDto> getListSearchLogin(String keyword, Integer user_num) throws Exception {
        return restaurantDao.selectSearchLogin(keyword, user_num);
    }

    // 내가 쓴 가게 리뷰 가져오기(마이페이지용)
    public RestaurantDto res(Integer num) throws Exception {
        RestaurantDto restaurantDto = restaurantDao.selectRes(num);

        return restaurantDto;
    }

    // 가게 리뷰 가져오기(상세페이지용)
    public List<ReviewDto> resReview(Integer num) throws Exception {

        return reviewDao.selectRes(num);
    }

}
