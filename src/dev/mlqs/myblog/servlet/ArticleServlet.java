package dev.mlqs.myblog.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.mlqs.myblog.model.Article;
import dev.mlqs.myblog.model.Comment;
import dev.mlqs.myblog.service.ArticleService;
import dev.mlqs.myblog.service.CommentService;
import dev.mlqs.myblog.service.TagService;
import dev.mlqs.myblog.utils.GravatarUtils;
import dev.mlqs.myblog.utils.ImageUtils;
import dev.mlqs.myblog.utils.SideInfoUtils;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 想要获取的文章 id
        String id = request.getParameter("id");
        ArticleService as = ArticleService.getInstance();
        // 文章
        Article a = as.getArticle("id", id).get(0);
        request.setAttribute("article", a);

        // 文章的所有标签
        TagService ts = TagService.getInstance();
        request.setAttribute("article_tags", ts.getTagById(id));
        // 获取上一篇文章
        request.setAttribute("article_pre", as.getPreviousArticle(a.getTime()));
        // 获取下一篇文章
        request.setAttribute("article_next", as.getNextArticle(a.getTime()));
        // 加载文章评论
        CommentService cs = CommentService.getInstance();
        List list = cs.loadComment(a.getId());
        request.setAttribute("comment", list);

        request.setAttribute("header_img", ImageUtils.getImg(id));

        SideInfoUtils.setUp(request, this);

        request.getRequestDispatcher("/article.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
