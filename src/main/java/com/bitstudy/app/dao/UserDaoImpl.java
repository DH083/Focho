package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    DataSource ds;

    @Autowired
    UserDao userDao;

    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.userMapper.";

    @Override
    public void deleteAll() throws SQLException {

    }

    @Override
    public int insertUser(UserDto userDto) {
        return session.insert(namespace+"insert" , userDto);
    }

    @Override
    public UserDto selectUser(String uid) throws Exception {
        return session.selectOne(namespace+"select" , uid);
    }

    @Override
    public UserDto selectUserNic(String nic) throws Exception {
        return session.selectOne(namespace+"selectNic" , nic);
    }

    @Override
    public int updateUser(UserDto user) throws Exception {
        return session.update(namespace+"updateUser", user);
    }

    @Override
    public int deleteUser(String id) throws SQLException {
        return 0;
    }

    private void close(AutoCloseable... acs) {
        for(AutoCloseable ac : acs) { // pstmt, conn
            try {
                if(ac != null) ac.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }
}
