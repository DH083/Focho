package com.bitstudy.app.domain;

public class TypeDto {
    private Integer num;
    private String txt;
    private String img;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
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

    @Override
    public String toString() {
        return "TypeDto{" +
                "num=" + num +
                ", txt='" + txt + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
