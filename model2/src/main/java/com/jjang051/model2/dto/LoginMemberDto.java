package com.jjang051.model2.dto;

public class LoginMemberDto {
    private String userId;
    private String userPw;

    public LoginMemberDto() {
    }

    public LoginMemberDto(String userId, String userPw) {
        this.userId = userId;
        this.userPw = userPw;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
}
