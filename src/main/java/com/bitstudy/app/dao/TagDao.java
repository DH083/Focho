package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TagDto;

import java.util.List;

public interface TagDao {
    List<TagDto> selectAll() throws Exception;
    TagDto selectTag(int num) throws Exception;
}
