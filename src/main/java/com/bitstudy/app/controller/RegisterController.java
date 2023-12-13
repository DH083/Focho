package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {

    @Autowired
    UserDao userDao;

    @GetMapping("/join")
    public String joinForm() {
        return "join";
    }

    @PostMapping("/idChk")
    @ResponseBody /* 서버에서 p(자바객체)를 사용자한테 보낼건데 텍스트방식 으로 전환해서 보내라는 뜻  */
    public String test(@RequestBody String id) throws Exception {
        System.out.println("id:" + id);

        if (!idChk(id)) {
            return "1";
        }
        return "2";
    }

    @PostMapping("/nicChk")
    @ResponseBody /* 서버에서 p(자바객체)를 사용자한테 보낼건데 텍스트방식 으로 전환해서 보내라는 뜻  */
    public String testNic(@RequestBody String nic) throws Exception {
        System.out.println("nic:" + nic);

        if (!nicChk(nic)) {
            return "1";
        }
        return "2";
    }

    @PostMapping("/join")
    public String join(UserDto user, Model m, String prevPage) throws Exception {

        // 유저 회원가입 시키기
        userDao.insertUser(user);

        return "redirect:/login";

    }

    // 데베에 id를 사용중인지 확인
    private boolean idChk(String id) throws Exception {
//        System.out.printf("id2: " + id);
//        id = "aa@aa.com";
        id=id.replace("\"","");
        System.out.println(userDao.selectUser(id));

        if(userDao.selectUser(id) != null) {

            UserDto user = userDao.selectUser(id);

            System.out.println("Chkid: " + id);


            System.out.println("user: " + user.getId());
            System.out.println("비교: " + (user.getId().equals(id)));

            return true;
        }
        return false;
    }

    // 데베에 nic를 사용중인지 확인
    private boolean nicChk(String nic) throws Exception {
        nic=nic.replace("\"","");

        if(userDao.selectUserNic(nic) != null) {

            return true;
        }
        return false;
    }
}