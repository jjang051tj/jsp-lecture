
package com.jjang051.replyboard.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ReplyBoardDto {
    private int no;
    private int num;
    private String title;
    private String content;
    private String userId;
    private String userName;
    private String password;
    private int regroup;
    private int relevel;
    private int restep;
    private int hit;
    private String regDate;
    private int available;
    private int parentId;
}
