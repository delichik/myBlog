package dev.mlqs.myblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.mlqs.myblog.service.ArticleService;
import dev.mlqs.myblog.utils.SideInfoUtils;

@WebServlet("/axis")
public class AxisServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArticleService as = ArticleService.getInstance();
        request.setAttribute("axis_list", as.getAxisList());

        SideInfoUtils.setUp(request, this);

        request.getRequestDispatcher("/axis.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
