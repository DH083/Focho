package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TagDto;
import com.bitstudy.app.domain.TypeDto;

import java.util.List;

public interface TypeDao {
    List<TypeDto> selectAll() throws Exception;
    TypeDto selectType(int num) throws Exception;
}
