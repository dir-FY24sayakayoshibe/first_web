package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SetAppScopeServlet")
public class SetAppScopeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SetAppScopeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getServletContext().setAttribute("app_name", "テストアプリケーション");

        response.setContentType("text/html; charset=UTF-8");
        var out = response.getWriter();
        out.println("アプリケーションスコープに登録完了");
    }
}
use_appScope.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% String app_name = (String)request.getServletContext().getAttribute("app_name"); %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>アプリケーションスコープのテスト</title>
    </head>
    <body>
        <h1><%= app_name %></h1>
    </body>
</html>