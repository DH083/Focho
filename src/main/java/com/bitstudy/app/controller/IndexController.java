package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class IndexController {

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    UserDao userDao;

    @Autowired
    TagDao tagDao;

    @Autowired
    TypeDao typeDao;

    @Autowired
    RestaurantService service;


    // 해당 번호의 레스토랑 정보 불러오기
    @GetMapping("/")
    public String reslist(Model m, HttpSession session) {

        try {
            String id = (String) session.getAttribute("id");

            List<TagDto> tagDto = tagDao.selectAll();
            List<TypeDto> typeDto = typeDao.selectAll();
            int count = tagDto.size();
            System.out.println("count: "+count);

            List<Integer> randomArray = new ArrayList<>();




            // 중복을 제외하고 tagcount 범위 안에서 랜덤 숫자 3개 뽑기
            for (int i=0; i<3; i++) {
                // count 범위 안에서 랜덤 숫자 뽑기 0은 제외할 것이므로 1 더해준다
                int random = (int) Math.floor(Math.random() * count + 1);

                if (randomArray.indexOf(random) == -1) {
                    // 중복이 아니라면 배열에 결과 값 넣기
                    randomArray.add(random);
                } else { // 중복이면 i값을 -1
                    i--;
                }
            }
            System.out.println("randomArray:" +randomArray);
            System.out.println("randomArray.length: " + randomArray.size());


            if (id == null) {
                // 분류별로 가게 정보 담아오기
                List<List<RestaurantDto>> restaurantDto = new ArrayList<>();

                for (int i=0;i< randomArray.size();i++) {
                    int num = randomArray.get(i);
                    List<RestaurantDto> list = service.getListTag(num);

                    // 매 반복마다 새로운 리스트에 결과 추가
                    List<RestaurantDto> tempList = new ArrayList<>(list);
                    restaurantDto.add(tempList);

                    System.out.println("list"+i+"="+list);


                    System.out.println("restaurantDto"+i+"="+restaurantDto);
                }

                m.addAttribute("restaurantDto", restaurantDto);

            } else if (id != null) {
                UserDto user = userDao.selectUser(id);
                Integer user_num = user.getNum();
                System.out.println("user: "+user_num);

                // 분류별로 가게 정보 담아오기
                List<List<RestaurantLoginDto>> restaurantLoginDto = new ArrayList<>();


                for (int i=0;i< randomArray.size();i++) {
                    int num = randomArray.get(i);
                    List<RestaurantLoginDto> list = service.getListTagLogin(num, user_num);
                    System.out.println("list"+i+"="+list);

                    // 매 반복마다 새로운 리스트에 결과 추가
                    List<RestaurantLoginDto> tempList = new ArrayList<>(list);
                    restaurantLoginDto.add(tempList);


                    System.out.println("restaurantDto"+i+"="+restaurantLoginDto);
                }

                m.addAttribute("restaurantDto", restaurantLoginDto);

                System.out.println("restaurantLoginDto: " + restaurantLoginDto);
            }

            m.addAttribute("randomArray", randomArray);
            m.addAttribute("typeDto", typeDto);
            m.addAttribute("tagDto", tagDto);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
}
