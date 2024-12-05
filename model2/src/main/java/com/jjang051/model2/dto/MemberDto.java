package com.jjang051.model2.dto;

public class MemberDto {
    private int no;
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String tel;
    private String zipcode;
    private String address;
    private String regDate;
    private String originalProfile;
    private String renameProfile;
    public MemberDto() {
    }

    public MemberDto(String userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getOriginalProfile() {
        return originalProfile;
    }

    public void setOriginalProfile(String originalProfile) {
        this.originalProfile = originalProfile;
    }

    public String getRenameProfile() {
        return renameProfile;
    }

    public void setRenameProfile(String renameProfile) {
        this.renameProfile = renameProfile;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "no=" + no +
                ", userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", tel='" + tel + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", address='" + address + '\'' +
                ", regDate='" + regDate + '\'' +
                ", originalProfile='" + originalProfile + '\'' +
                ", renameProfile='" + renameProfile + '\'' +
                '}';
    }
}
