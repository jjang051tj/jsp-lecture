package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/member/signup")
@MultipartConfig
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/member/signup.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String zipcode = req.getParameter("zipcode");
        String addr01 = req.getParameter("addr01");
        String addr02 = req.getParameter("addr02");
        String tel = req.getParameter("tel");
        
        Part filePart = req.getPart("profile");  //part로 넘어온 file 받기
        String originalProfile = filePart.getSubmittedFileName();  //진짜 이름 받기
        int dotNum =  originalProfile.lastIndexOf("."); // 진짜 이름에서 점의 위치 찾기
        String extension = originalProfile.substring( dotNum+ 1); // 확장자 출력
        String extractFileName = originalProfile.substring(0,dotNum);  // 파일이름 출력
        UUID uuid = UUID.randomUUID();   // 랜덤한 값 만들기
        String uuidStr = uuid.toString(); // 랜덤한 값 만들기
        String renameProfile = extractFileName+"_"+uuidStr+"."+extension;  // 원래 이름에 랜덤값 더해서 새로운 이름 만들기
        String saveDirectory = getServletContext().getRealPath("")+File.separator+"upload";
        Path savePath = Paths.get(saveDirectory);
        System.out.println("saveDirectory==="+saveDirectory);
        if(!Files.exists(savePath)) {
            Files.createDirectories(savePath);
        }

        Path newFile =  Paths.get(saveDirectory+File.separator+renameProfile);

        Files.copy(filePart.getInputStream(),newFile, StandardCopyOption.REPLACE_EXISTING);

        Thumbnails.of(newFile.toFile())
                .size(100,100)
                .keepAspectRatio(true) // default
                .toFile(newFile.toFile());

        String salt = BCrypt.gensalt(); // 같은 비밀번호를 쓰더라도 소금쳐서 다르게 나오게 만들기
        userPw = BCrypt.hashpw(userPw, salt);

        //Files.delete();


        MemberDto insertMemberDto = new MemberDto();
        insertMemberDto.setUserId(userId);
        insertMemberDto.setUserPw(userPw);
        insertMemberDto.setUserName(userName);
        insertMemberDto.setUserEmail(userEmail);
        insertMemberDto.setZipcode(zipcode);
        insertMemberDto.setAddress(addr01 + "/" + addr02);
        insertMemberDto.setTel(tel);
        insertMemberDto.setOriginalProfile(originalProfile);
        insertMemberDto.setRenameProfile(renameProfile);


        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.insertMember(insertMemberDto);
        if (result > 0) {
            JSFunction.alertAndLocation("회원가입되었습니다. 로그인 페이지로 이동합니다.", "../member/login", resp);
        } else {
            JSFunction.alertAndBack("알 수 없는 오류가 발생되었습니다. 다시 입력해 주세요..", resp);
        }
    }
}
