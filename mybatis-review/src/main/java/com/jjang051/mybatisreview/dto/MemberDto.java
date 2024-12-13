package com.jjang051.mybatisreview.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDto {
    private int no;
    private String userId;
    private String userName;
    private String userPw;
    private String userEmail;
    private String tel;
    private String address;
    private String zipcode;
    private String regDate;
    private String originalProfile;
    private String renameProfile;
}
