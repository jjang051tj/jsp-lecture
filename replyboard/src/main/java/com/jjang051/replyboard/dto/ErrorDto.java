package com.jjang051.replyboard.dto;

import lombok.*;

import java.util.Map;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ErrorDto {
    private Map<String,String> errorMap;
    private int errorCode;

}
