package com.jjang051.jsp04_cookie.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
    public static void makeCookie(HttpServletResponse httpServletResponse,
                                  String cookieName,
                                  String cookieValue,
                                  int cookieTime) {

        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setPath("/");
        cookie.setMaxAge(cookieTime);
        httpServletResponse.addCookie(cookie);
    }
    public static String readCookie(HttpServletRequest httpServletRequest, String cookieName) {
        String cookieValue = "";
        Cookie[] cookies = httpServletRequest.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                String cName = cookie.getName();
                if(cName.equals(cookieName)) {
                    cookieValue = cookie.getValue();
                }
            }
        }
        return cookieValue;
    }
    public static void deleteCookie(HttpServletResponse httpServletResponse, String cookieName) {
        makeCookie(httpServletResponse, cookieName, "", 0);
    }
}
