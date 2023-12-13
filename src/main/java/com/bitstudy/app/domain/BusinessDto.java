package com.bitstudy.app.domain;

public class BusinessDto {
    private int num;
    private String open;
    private String close;
    private String break_start;
    private String break_end;
    private int day;
    private int res_num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getOpen() {
        open = open.substring(0, 5);
        return open;
    }

    public void setOpen(String open) {
        this.open = open;
    }

    public String getClose() {
        close = close.substring(0, 5);
        return close;
    }

    public void setClose(String close) {
        this.close = close;
    }

    public String getBreak_start() {
        break_start = break_start.substring(0, 5);
        return break_start;
    }

    public void setBreak_start(String break_start) {
        this.break_start = break_start;
    }

    public String getBreak_end() {
        break_end = break_end.substring(0, 5);
        return break_end;
    }

    public void setBreak_end(String break_end) {
        this.break_end = break_end;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getRes_num() {
        return res_num;
    }

    public void setRes_num(int res_num) {
        this.res_num = res_num;
    }

    @Override
    public String toString() {
        return "BusinessDto{" +
                "num=" + num +
                ", open='" + open + '\'' +
                ", close='" + close + '\'' +
                ", break_start='" + break_start + '\'' +
                ", break_end='" + break_end + '\'' +
                ", day='" + day + '\'' +
                ", res_num='" + res_num + '\'' +
                '}';
    }
}
