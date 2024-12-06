package com.jjang051.model2.dto;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class VisualDto {
    private int no;
    private String mainTxt;
    private String subTxt;
    private String originalFile;
    private String renameFile;
    private String isShow;
    private String regDate;
}
