package com.jjang051.model2.utils;

import java.util.UUID;

public class FileUtil {
    public static String renameFile(String originalFileName)  {
        int dotNum =  originalFileName.lastIndexOf("."); // 진짜 이름에서 점의 위치 찾기
        String extension = originalFileName.substring( dotNum+ 1); // 확장자 출력
        String extractFileName = originalFileName.substring(0,dotNum);  // 파일이름 출력
        UUID uuid = UUID.randomUUID();   // 랜덤한 값 만들기
        String uuidStr = uuid.toString(); // 랜덤한 값 만들기
        String renameFileName = extractFileName+"_"+uuidStr+"."+extension;
        return renameFileName;
    }
}
