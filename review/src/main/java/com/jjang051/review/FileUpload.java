package com.jjang051.review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/file-upload")
@MultipartConfig
public class FileUpload  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/file-upload.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        Part filePart = req.getPart("attachFile");
        //String partHeader = filePart.getHeader("content-disposition");
        //String attachFile = req.getParameter("attachFile"); //이건 스트링 처리용 file은 못받음
        //System.out.println("title==="+title);
        //System.out.println("partHeader==="+partHeader);
        //String[] partHeaderArray = partHeader.split("filename=");
        //String originalFileName = partHeaderArray[1].replace("\"","");
        String originalFileName = filePart.getSubmittedFileName();
        System.out.println("originalFileName==="+originalFileName);
        String extention = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
        String extractFileName = originalFileName.substring(0,originalFileName.lastIndexOf("."));
        UUID uuid = UUID.randomUUID();
        String uuidStr = uuid.toString();
        String renameFileName = extractFileName+"-"+uuidStr+"."+extention;
        System.out.println("originalFileName==="+originalFileName);
        System.out.println("renameFileName==="+renameFileName);
    }
}
