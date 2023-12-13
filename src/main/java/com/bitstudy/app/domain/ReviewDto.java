package com.bitstudy.app.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewDto {
    private int num;
    private int score;
    private String txt;
    private String img;
    private Date date;
    private int user_num;
    private int res_num;
    private String user_name;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        return dateFormat.format(this.date);
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getUser_num() {
        return user_num;
    }

    public void setUser_num(int user_num) {
        this.user_num = user_num;
    }

    public int getRes_num() {
        return res_num;
    }

    public void setRes_num(int res_num) {
        this.res_num = res_num;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "num=" + num +
                ", score=" + score +
                ", txt='" + txt + '\'' +
                ", img='" + img + '\'' +
                ", date=" + date +
                ", user_num=" + user_num +
                ", res_num=" + res_num +
                ", user_name=" + user_name +
                '}';
    }
}
