package com.jjang051.mybatisreview.dto;

import lombok.*;

import java.util.Map;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ErrorDto {
    private int code;
    private Map<String, Object> errorMap;
}
