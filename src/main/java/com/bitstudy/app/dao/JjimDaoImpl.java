package com.bitstudy.app.dao;

import com.bitstudy.app.domain.JjimDto;
import com.bitstudy.app.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class JjimDaoImpl implements JjimDao {

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.jjimMapper."; /* 주의: 마지막에 . 있음 */

    @Override
    public void deleteAll() throws SQLException {

    }

    @Override
    public int deleteJjim(int res_num, int user_num) {
        Map map = new HashMap();
        map.put("res_num",res_num);
        map.put("user_num",user_num);

System.out.println(res_num +", " + user_num);

        return session.delete(namespace+"deleteJjim" , map);
    }

    @Override
    public List<JjimDto> insertJjim(JjimDto jjimDto) {
        return session.selectList(namespace+"insertJjim", jjimDto);
    }

    @Override
    public JjimDto selectJjim(int num) throws Exception {
        return null;
    }

    @Override
    public List<JjimDto> selectUser(Integer num) {
        return session.selectList(namespace+"selectUser", num);
    }

    @Override
    public int updateJjim(JjimDto jjim) throws Exception {
        return 0;
    }
}
