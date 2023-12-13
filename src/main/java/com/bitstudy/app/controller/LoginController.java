package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginForm(HttpSession session) {
        return "login";
    }

    @GetMapping("/login/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 즉시 삭제
        return "redirect:/"; // 삭제 후 메인페이지로 다시 이동
    }

    @Autowired
    UserDao userDao;

    @PostMapping("/login")
    public String login(String id, String pw, String name, boolean ch_save, Model m, HttpServletResponse response, HttpServletRequest request, String prevPage) throws Exception {

        if(!loginChk(id, pw)) {
            String pocho_text = URLEncoder.encode("일치하는 회원 정보가 없습니다.", "utf-8");
            m.addAttribute("pocho_text", pocho_text);
            m.addAttribute("prevPage", prevPage);
            return "redirect:/login?pocho_text="+pocho_text;
        }

        // 쿠키 생성
        Cookie cookie = new Cookie("id", id);
        if(ch_save) {
            cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
            cookie.setPath("/");
        }
        else if(!ch_save) {
            cookie.setMaxAge(0);
            cookie.setPath("/");
        }
        response.addCookie(cookie);
        // 사용자에게 돌려보낼 '응답'에 쿠키 넣어서 보내기

        UserDto user = userDao.selectUser(id);
        name = user.getName();


        /* 세션 */
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setAttribute("name", name);


        // 이전 페이지 URL이 존재하면 해당 페이지로 리디렉션
        if (prevPage != null && !prevPage.isEmpty()) {
            request.getSession().removeAttribute("prevPage"); // 이후 세션에서 제거
            return "redirect:" + prevPage;
        } else {
            // 이전 페이지 URL이 없을 경우 기본 페이지로 이동
            return "redirect:/"; // 기본 페이지 URL
        }

//        return "redirect:/";
    }


    private boolean loginChk(String id, String pw) throws Exception {
        UserDto user = userDao.selectUser(id);
        if(user==null) return false;
        return user.getPw().equals(pw);
    }
}
