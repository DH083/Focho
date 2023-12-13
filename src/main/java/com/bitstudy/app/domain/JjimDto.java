package com.bitstudy.app.domain;

public class JjimDto {

    private int num;
    private int user_num;
    private int res_num;

    public JjimDto() {}

    public JjimDto(int num, int user_num, int res_num) {
        this.num = num;
        this.user_num = user_num;
        this.res_num = res_num;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
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

    @Override
    public String toString() {
        return "JjimDto{" +
                "num=" + num +
                ", user_num=" + user_num +
                ", res_num=" + res_num +
                '}';
    }
}
