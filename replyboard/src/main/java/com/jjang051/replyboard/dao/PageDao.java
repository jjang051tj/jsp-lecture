package com.jjang051.replyboard.dao;

import com.jjang051.replyboard.common.JDBCConnection;
import jakarta.servlet.ServletContext;

public class PageDao extends JDBCConnection {
    public PageDao(ServletContext application) {
        super(application);
    }

}
