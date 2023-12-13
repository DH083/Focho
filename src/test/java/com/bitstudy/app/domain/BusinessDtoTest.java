package com.bitstudy.app.domain;

import org.junit.Test;

import java.util.Calendar;

import static org.junit.Assert.*;

public class BusinessDtoTest {

    private String open;

    @Test
    public String getOpen() {

        return open;
    }

    @Test
    public void setOpen(String open) {
//        this.open = Calendar.HOUR(open);
        System.out.println("open: " + open);
    }

    @Test
    public void getDay() {
    }

    @Test
    public void setDay() {
    }
}