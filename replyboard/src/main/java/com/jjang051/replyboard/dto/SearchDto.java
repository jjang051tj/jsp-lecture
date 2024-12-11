package com.jjang051.replyboard.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SearchDto {
    private String keyword;
    private String category;
    private PageDto pageDto;
//    private int startPage;
//    private int endPage;

}
