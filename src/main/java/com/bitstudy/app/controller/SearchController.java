package com.bitstudy.app.controller;

import com.bitstudy.app.dao.RestaurantDao;
import com.bitstudy.app.dao.TagDao;
import com.bitstudy.app.dao.TypeDao;
import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    UserDao userDao;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    TagDao tagDao;

    @Autowired
    TypeDao typeDao;

    @Autowired
    RestaurantService restaurantService;

    @GetMapping("/search")
//    @PathVariable
    public String search(String keyword, Model m, HttpSession session) {
        try {
            // 세션에 저장된 아이디 가져와서 String 으로 저장히기
            String id = (String) session.getAttribute("id");

            // 저장한 유저 아이디로 유저 번호 들고오기
            UserDto user = userDao.selectUser(id);

            List<TypeDto> typeDto = typeDao.selectAll();
            List<TagDto> tagDto = tagDao.selectAll();
//            List<RestaurantDto> restaurantDto = restaurantDao.selectSearch(keyword);

            m.addAttribute("user", user);
            m.addAttribute("tagDto", tagDto);
            m.addAttribute("typeDto", typeDto);
//            m.addAttribute("restaurantDto", restaurantDto);

            if (id == null) {
                // 분류별로 가게 정보 담아오기
                List<RestaurantDto> restaurantDto = restaurantDao.selectSearch(keyword);

                m.addAttribute("restaurantDto", restaurantDto);

            } else if (id != null) {
                Integer user_num = user.getNum();

                // 분류별로 가게 정보 담아오기
                List<RestaurantLoginDto> restaurantLoginDtos = restaurantService.getListSearchLogin(keyword, user_num);

                m.addAttribute("restaurantDto", restaurantLoginDtos);

            }



        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "search";
    }

//    @GetMapping("/searchView")
//    @ResponseBody
//    public ResponseEntity<List<RestaurantDto>> selectSearchName(String keyword, Model m) {
//        try {
//
//            System.out.println("keyword: " +keyword);
//            List<RestaurantDto> restaurantDto = restaurantDao.selectSearch(keyword);
//
//            System.out.println("restaurantDto: " + restaurantDto);
//
//            List<TypeDto> typeDto = typeDao.selectAll();
//            List<TagDto> tagDto = tagDao.selectAll();
//
//            m.addAttribute("tagDto", tagDto);
//            m.addAttribute("typeDto", typeDto);
//
//            return new ResponseEntity<List<RestaurantDto>> (restaurantDto, HttpStatus.OK); // 200
//        } catch (Exception e) {
////            throw new RuntimeException(e);
//            e.printStackTrace();
//            return new ResponseEntity<List<RestaurantDto>> (HttpStatus.BAD_REQUEST); // 400
//        }
//        /* ResponseEntity - 응답이나 요청시 전송할 정보를 보낼 대상에게 상태코드를 설정 */
//
//    }
}
