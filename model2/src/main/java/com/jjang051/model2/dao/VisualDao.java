package com.jjang051.model2.dao;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dto.VisualDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VisualDao extends JDBCConnection {
    public VisualDao(ServletContext application) {
        super(application);
    }
    public int insertVisual(VisualDto visualDto) {
        int result = 0;

        try {
            String sql = "insert into visual values(seq_visual.nextval,?,?,?,?,'show',sysdate)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,visualDto.getMainTxt());
            preparedStatement.setString(2,visualDto.getSubTxt());
            preparedStatement.setString(3,visualDto.getOriginalFile());
            preparedStatement.setString(4,visualDto.getRenameFile());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<VisualDto> getAllVisual() {
        List<VisualDto> visualDtoList = null;
        try {
            String sql = "select * from visual";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            visualDtoList = new ArrayList<>();
            while (resultSet.next()) {
                VisualDto visualDto =
                        VisualDto.builder()
                                .no(resultSet.getInt("no"))
                                .mainTxt(resultSet.getString("mainTxt"))
                                .subTxt(resultSet.getString("subTxt"))
                                .renameFile(resultSet.getString("renamevisual"))
                        .build();
                visualDtoList.add(visualDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return visualDtoList;
    }
    public List<VisualDto> getCheckedAllVisual() {
        List<VisualDto> visualDtoList = null;
        try {
            String sql = "select * from visual where isShow = 'show'";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            visualDtoList = new ArrayList<>();
            while (resultSet.next()) {
                VisualDto visualDto =
                        VisualDto.builder()
                                .no(resultSet.getInt("no"))
                                .mainTxt(resultSet.getString("mainTxt"))
                                .subTxt(resultSet.getString("subTxt"))
                                .renameFile(resultSet.getString("renamevisual"))
                                .build();
                visualDtoList.add(visualDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return visualDtoList;
    }

    public int getCheckedVisual(String[] checkList) {
        int result = 0;
        //List<VisualDto> visualDtoList = null;
        //String sql = "select * from visual where no in (?,?,?,?)";
        //UPDATE visual SET isShow = 'blind' WHERE NO IN (9,10);
        StringBuilder stringBuilder = new StringBuilder("UPDATE visual SET isShow = 'blind' WHERE NO IN (");
        for(int i=0;i<checkList.length;i++){
            stringBuilder.append("?");
            if(i<checkList.length-1){
                stringBuilder.append(",");
            }
        }
        stringBuilder.append(")");
        String sql = stringBuilder.toString();
        System.out.println("sql:" + sql);
        try {
            preparedStatement = connection.prepareStatement(sql);
            for(int i=0;i<checkList.length;i++){
                preparedStatement.setString(i+1, checkList[i]);
            }
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
}
