package com.jjang051.model2.dao;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dto.VisualDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;

public class VisualDao extends JDBCConnection {
    public VisualDao(ServletContext application) {
        super(application);
    }
    public int insertVisual(VisualDto visualDto) {
        int result = 0;

        try {
            String sql = "insert into visual values(seq_visual.nextval,?,?,?,?,sysdate)";
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
}
