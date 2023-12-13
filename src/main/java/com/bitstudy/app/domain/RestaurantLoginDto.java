package com.bitstudy.app.domain;

public class RestaurantLoginDto {
    private int num;
    private String name;
    private String address;
    private String city;
    private String img;
    private String tel;
    private float rev_score;
    private int rev_count;
    private int type_num;
    private int tag_num;
    private int user_num;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public float getRev_score() {
        rev_score = (float) (Math.round(rev_score * 100.0) / 100.0);
        return rev_score;
    }

    public void setRev_score(float rev_score) {
        this.rev_score = rev_score;
    }

    public int getRev_count() {
        return rev_count;
    }

    public void setRev_count(int rev_count) {
        this.rev_count = rev_count;
    }

    public int getType_num() {
        return type_num;
    }

    public void setType_num(int type_num) {
        this.type_num = type_num;
    }

    public int getTag_num() {
        return tag_num;
    }

    public void setTag_num(int tag_num) {
        this.tag_num = tag_num;
    }

    public int getUser_num() {
        return user_num;
    }

    public void setUser_num(int user_num) {
        this.user_num = user_num;
    }

    @Override
    public String toString() {
        return "RestaurantDto{" +
                "num=" + num +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", img='" + img + '\'' +
                ", tel=" + tel +
                ", rev_score=" + rev_score +
                ", rev_count=" + rev_count +
                ", type_num=" + type_num +
                ", tag_num=" + tag_num +
                ", user_num=" + user_num +
                '}';
    }
}
