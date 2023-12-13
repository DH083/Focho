package com.bitstudy.app.domain;

public class MenuDto {

    private int num;
    private String name;
    private int price;
    private int res_num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRes_num() {
        return res_num;
    }

    public void setRes_num(int res_num) {
        this.res_num = res_num;
    }

    @Override
    public String toString() {
        return "MenuDto{" +
                "num=" + num +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", res_num=" + res_num +
                '}';
    }
}
