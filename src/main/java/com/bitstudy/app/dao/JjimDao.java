package com.bitstudy.app.dao;

import com.bitstudy.app.domain.JjimDto;
import com.bitstudy.app.domain.ReviewDto;

import java.sql.SQLException;
import java.util.List;

public interface JjimDao {
    void deleteAll() throws SQLException;
    int deleteJjim(int res_num, int user_num) throws SQLException;

    List<JjimDto> insertJjim(JjimDto jjimDto);

    JjimDto selectJjim(int num) throws Exception;
    List<JjimDto> selectUser(Integer num);

    int updateJjim(JjimDto like) throws Exception;
}
