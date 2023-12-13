package com.bitstudy.app.domain;

public class TagDto {
    private int num;
    private String txt;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    @Override
    public String toString() {
        return "TagDto{" +
                "num=" + num +
                ", txt='" + txt + '\'' +
                '}';
    }
}
