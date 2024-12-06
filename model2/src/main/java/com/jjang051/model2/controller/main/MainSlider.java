package com.jjang051.model2.controller.main;

import com.jjang051.model2.dao.VisualDao;
import com.jjang051.model2.dto.VisualDto;
import com.jjang051.model2.utils.FileUtil;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.coobird.thumbnailator.Thumbnails;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/main/slide")
@MultipartConfig
public class MainSlider extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/main/slide.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainTxt = req.getParameter("main-txt");
        String subTxt = req.getParameter("sub-txt");
        Part filePart = req.getPart("visual");
        String originalFile = filePart.getSubmittedFileName();
        String renameFile = FileUtil.renameFile(originalFile);
        String saveDirectory = getServletContext().getRealPath("")+File.separator+"upload";
        Path savePath = Paths.get(saveDirectory);
        if(!Files.exists(savePath)) {
            Files.createDirectories(savePath);
        }


        VisualDao visualDao = new VisualDao(req.getServletContext());
        VisualDto visualDto = VisualDto.builder()
                .mainTxt(mainTxt)
                .subTxt(subTxt)
                .originalFile(originalFile)
                .renameFile(renameFile)
                .build();
        int result = visualDao.insertVisual(visualDto);
        if(result > 0) {
            Path newFile =  Paths.get(saveDirectory+File.separator+renameFile);
            Files.copy(filePart.getInputStream(),newFile, StandardCopyOption.REPLACE_EXISTING);
            resp.sendRedirect("../index/index");
        } else {
            JSFunction.alertAndBack("알 수 없는 오류가 발생되었습니다. 잠시 후 다시 시도해 주세요",resp );
        }
    }
}
