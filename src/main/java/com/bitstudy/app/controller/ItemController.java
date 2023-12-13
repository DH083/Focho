package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.RestaurantService;
import com.bitstudy.app.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
public class ItemController {

    @Autowired
    UserDao userDao;

    @Autowired
    RestaurantDao restaurantDao;

    @Autowired
    MenuDao menuDao;

    @Autowired
    ReviewDao reviewDao;

    @Autowired
    TagDao tagDao;

    @Autowired
    TypeDao typeDao;

    @Autowired
    JjimDao jjimDao;

    @Autowired
    BusinessDao businessDao;

    @Autowired
    RestaurantService restaurantService;

    @Autowired
    ReviewService reviewService;

    // 가게 1개 정보 가져오기
    @GetMapping("/item")
    public String item(Integer num, Model model, HttpSession session) {
        try {

            String id = (String) session.getAttribute("id");

//            RestaurantDto restaurantDto = restaurantService.res(num);
            List<MenuDto> menuDto = menuDao.selectMenu(num);
            List<ReviewDto> reviewDto = reviewDao.selectRes(num);
            List<TagDto> tagDto = tagDao.selectAll();
            List<TypeDto> typeDto = typeDao.selectAll();

            // 오늘 요일 뽑기
            LocalDate today = LocalDate.now();
            DayOfWeek dayOfWeek = today.getDayOfWeek();
            int day = dayOfWeek.getValue();

            // 오늘 영업시간 불러오기
            BusinessDto businessDtoToday = businessDao.selectTimeToday(num, day);

            // 전체 영업시간 불러오기
            List<BusinessDto> businessDto = businessDao.selectTime(num);
//            System.out.println("businessDto: " + businessDto);

            List<String> dayList = new ArrayList<>();
            dayList.add("월");
            dayList.add("화");
            dayList.add("수");
            dayList.add("목");
            dayList.add("금");
            dayList.add("토");
            dayList.add("일");

            model.addAttribute("menuDto", menuDto);
            model.addAttribute("reviewDto", reviewDto);
            model.addAttribute("tagDto", tagDto);
            model.addAttribute("typeDto", typeDto);
            model.addAttribute("businessDto", businessDto);
            model.addAttribute("businessDtoToday", businessDtoToday);
            model.addAttribute("dayList", dayList);

            if (id == null) {
                // 분류별로 가게 정보 담아오기
                RestaurantDto restaurantDto = restaurantDao.selectRes(num);

                model.addAttribute("restaurantDto", restaurantDto);

            } else if (id != null) {
                UserDto user = userDao.selectUser(id);
                Integer user_num = user.getNum();

                // 분류별로 가게 정보 담아오기
                RestaurantLoginDto restaurantLoginDto = restaurantService.getResLogin(num, user_num);

                model.addAttribute("restaurantDto", restaurantLoginDto);

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return "item";
    }


    // 해당 게시글의 댓글 전체 불러오기
    @GetMapping("/review")
    @ResponseBody
    public ResponseEntity<List<ReviewDto>> list(Integer num) {
        try {

//            System.out.println("num: " +num);
            List<ReviewDto> list = restaurantService.resReview(num);

//            System.out.println("list: " + list);
            return new ResponseEntity<List<ReviewDto>> (list, HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<List<ReviewDto>> (HttpStatus.BAD_REQUEST); // 400
        }
        /* ResponseEntity - 응답이나 요청시 전송할 정보를 보낼 대상에게 상태코드를 설정 */

    }

    // 리뷰 저장하기
    @PostMapping("/add/review")
    @ResponseBody
    public ResponseEntity<String> addReview(@RequestBody ReviewDto reviewDto, Integer num, HttpSession session) {
        try {
            // 세션에 저장된 아이디 가져와서 String 으로 저장히기
            String id = (String) session.getAttribute("id");

            // 저장한 유저 아이디로 유저 번호 들고오기
            UserDto user = userDao.selectUser(id);
            int user_num = user.getNum();
            String user_name = user.getName();

            System.out.println("reviewDto: " + reviewDto);


            reviewDto.setUser_num(user_num);
            reviewDto.setRes_num(num);
            reviewDto.setUser_name(user_name);

            System.out.println("reviewDto: " + reviewDto);


            if(reviewService.addReview(reviewDto, num) != 1) {
                throw new Exception("실패");
            }

            return new ResponseEntity<String> ("댓글 등록 성공", HttpStatus.OK); // 200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> ("댓글 등록 실패", HttpStatus.BAD_REQUEST); // 400
        }
    }

    /* 삭제 */
    @DeleteMapping("/delete/{cno}")
    /* (Restful API) {cno} 처럼 맵핑된 URL의 일부 값을 가져올 때는 @PathVariable를 붙인다.   */
//    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
        try {
            String id = (String) session.getAttribute("id");
            UserDto user = userDao.selectUser(id);
            int user_num = user.getNum();
            ReviewDto reviewDto = reviewDao.selectReview(cno);
            int score = reviewDto.getScore();

            if(reviewService.removeReview(bno, cno, user_num, score) != 1) {
                throw new Exception("실패");
            }
            return new ResponseEntity<String> ("댓글 삭제 성공", HttpStatus.OK); // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String> ("댓글 삭제 실패", HttpStatus.BAD_REQUEST); // 400
        }

    }
}
