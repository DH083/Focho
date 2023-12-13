package com.bitstudy.app.domain;

import java.util.Date;

public class UserDto {
    private int num;
    private String id;
    private String pw;
    private String name;
    private String tel;
    private Date joinDate;
    private String email;

    public UserDto() {}

    public UserDto(int num, String id, String pw, String name, String tel, Date joinDate) {
        this.num = num;
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.tel = tel;
        this.joinDate = joinDate;
    }
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String  getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "num='" + num + '\'' +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", joinDate=" + joinDate +
                ", email=" + email +
                '}';
    }
}
