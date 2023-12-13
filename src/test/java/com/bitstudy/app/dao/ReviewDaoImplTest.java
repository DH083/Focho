package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReviewDaoImplTest {

    @Autowired
    ReviewDao reviewDao;



    @Test
    public void selectAll() throws Exception {
//        List<ReviewDto> list = (List<ReviewDto>) reviewDao.selectAll();
//
//        /* 혹시 한줄씩 찍어보고 싶으면 이거 사용...*/
//        for(ReviewDto tmp : list) {
//            System.out.println(tmp);
//        }
//        assertTrue(list.size() > 0);
    }
}