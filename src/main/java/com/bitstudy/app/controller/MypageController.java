package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MypageController {

    @Autowired
    UserDao userDao;

    @Autowired
    ReviewDao reviewDao;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    TagDao tagDao;

    @Autowired
    TypeDao typeDao;

    @Autowired
    JjimDao jjimDao;

    @GetMapping("/mypage")
    public String mypage(HttpSession session, HttpServletRequest request, Model m) throws Exception {
        // 로그인 했는지 체크
        if(!loginChk(request)) {
            System.out.println("request:  " + request.getRequestURL());
            return "redirect:/login?prevPage="+request.getRequestURL();
        }

        // 세션에 저장된 아이디 가져와서 String 으로 저장히기
        String id = (String) session.getAttribute("id");

        // 저장한 유저 아이디로 유저 번호 들고오기
        UserDto user = userDao.selectUser(id);
        int num = user.getNum();
//        System.out.println(num);

        // 리뷰 데베에서 유저 번호로 리뷰 들고오기
        List<ReviewDto> reviewDto = reviewDao.selectUser(num);
        System.out.println("reviewDto: " + reviewDto);

        // 가게 목록에서 찜 테이블에 유저가 유저번호인 가게 목록 들고오기
        List<RestaurantDto> restaurantDto = restaurantDao.selectJjim(num);
        System.out.println("restaurantDto: " + restaurantDto);

        List<TagDto> tagDto = tagDao.selectAll();
        List<TypeDto> typeDto = typeDao.selectAll();




        // 모델에 담아주기
        m.addAttribute("userDto", user);
        m.addAttribute("reviewDto", reviewDto);
        m.addAttribute("restaurantDto", restaurantDto);
        m.addAttribute("tagDto", tagDto);
        m.addAttribute("typeDto", typeDto);

        return "mypage";
    }

    @GetMapping("/jjim/add")
    @ResponseBody
    public String jjimAdd(JjimDto jjimDto, HttpSession session) {
        try {
            // 세션에 저장된 아이디 가져와서 String 으로 저장히기
            String id = (String) session.getAttribute("id");

            System.out.println("jjimDto1: " + jjimDto);

            // 저장한 유저 아이디로 유저 번호 들고오기
            UserDto user = userDao.selectUser(id);
            jjimDto.setUser_num(user.getNum());
//
            System.out.println("jjimDto2: " + jjimDto);
//
            jjimDao.insertJjim(jjimDto);

            return "찜 완료";
        } catch (Exception e) {
            e.printStackTrace();
            return "찜 실패";

        }
    }

    @DeleteMapping("/jjim/remove/{res_num}")
    public ResponseEntity<String> jjimRemove(@PathVariable Integer res_num, HttpSession session) {
        try {
            // 세션에 저장된 아이디 가져와서 String 으로 저장히기
            String id = (String) session.getAttribute("id");
            System.out.println("res_num: "+res_num);


            // 저장한 유저 아이디로 유저 번호 들고오기
            UserDto user = userDao.selectUser(id);
            int user_num = user.getNum();

            jjimDao.deleteJjim(res_num, user_num);

            return new ResponseEntity<String> ("OKOK", HttpStatus.OK); // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> ("찜 삭제 실패", HttpStatus.BAD_REQUEST); // 400
        }
    }

    @GetMapping("/userChange")
    public String userinfoChangeForm(HttpSession session, Model m) throws Exception {

        String id = (String) session.getAttribute("id");

        UserDto userDto = userDao.selectUser(id);

        System.out.println("userDto: " + userDto);

        m.addAttribute("userDto", userDto);

        return "user_change";
    }

    @PostMapping("/userChange")
    public String userinfoChange(UserDto user) throws Exception {

        // 유저 회원가입 시키기
        userDao.updateUser(user);

        return "redirect:/mypage";

    }

    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }
}
