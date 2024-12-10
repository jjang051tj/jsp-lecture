package com.jjang051.replyboard.controller.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet("/board/upload")
@MultipartConfig
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //<input type="file" name="upload">
        System.out.println("post image upload");
        Part filePart = req.getPart("upload");
        String originalFileName = filePart.getSubmittedFileName();
        System.out.println("originalFileName==="+originalFileName);
        //json으로
        // {uploaded:true,url:이미지경로}
    }
}
