package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    UserDao userDao;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    TagDao tagDao;

    @Autowired
    TypeDao typeDao;

    @Autowired
    JjimDao jjimDao;

    @Autowired
    RestaurantService restaurantService;

    @GetMapping("/product")
    public String product(Integer num, Model m, HttpSession session) {
        try {
            String id = (String) session.getAttribute("id");


            List<TypeDto> typeDto = typeDao.selectAll();
            List<TagDto> tagDto = tagDao.selectAll();

            m.addAttribute("tagDto", tagDto);
            m.addAttribute("typeDto", typeDto);


            if (id == null) {
                // 분류별로 가게 정보 담아오기
                List<RestaurantDto> restaurantDto = restaurantService.getListType(num);

                m.addAttribute("restaurantDto", restaurantDto);

            } else if (id != null) {
                UserDto user = userDao.selectUser(id);
                Integer user_num = user.getNum();
                System.out.println("user: "+user_num);

                // 분류별로 가게 정보 담아오기
                List<RestaurantLoginDto> restaurantLoginDtos = restaurantService.getListTypeLogin(num, user_num);

                m.addAttribute("restaurantDto", restaurantLoginDtos);

                System.out.println("restaurantLoginDtos: " + restaurantLoginDtos);
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "product";
    }


}
