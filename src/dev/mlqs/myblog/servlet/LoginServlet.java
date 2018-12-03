package dev.mlqs.myblog.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.mlqs.myblog.dao.ArticleDao;
import dev.mlqs.myblog.db.VisitorDB;
import dev.mlqs.myblog.service.ArticleService;
import dev.mlqs.myblog.service.TagService;
import dev.mlqs.myblog.utils.LoginUtils;
import dev.mlqs.myblog.utils.XMLUtils;

/**
 * Login->index.jsp->init data
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LoginUtils.login(request);

		// 初始化分类
		ArticleService as = ArticleService.getInstance();
		request.setAttribute("sort_count_map", as.getSortAndCount());
		// 初始化文章列表
		request.setAttribute("article_list", as.getArticle());
		// 初始化获取标签
		TagService ts = TagService.getInstance();
		request.setAttribute("tag_list", ts.getAllTag());

		// 初始化侧边栏 日志、分类、标签的个数
		request.setAttribute("article_number", as.getCount(ArticleDao.SEARCH_ARTICLE));
		request.setAttribute("sort_number", as.getCount(ArticleDao.SEARCH_SORT));
		request.setAttribute("tags_number", ts.getTagCount());

		// 阅读排行
		request.setAttribute("visit_rank", as.getVisitRank());

		// 传网站的统计数据
		request.setAttribute("visited", VisitorDB.totalVisit());
		request.setAttribute("member", VisitorDB.totalMember());

		// 读取主页信息
		ArrayList<String[]> list = XMLUtils.getNodeList(this.getClass().getResource("/").getPath() + "blog-info.xml");
		assert list != null;
		for (String[] vs : list) {
			request.setAttribute(vs[0], vs[1]);
		}


		// 转发到 博客主页 界面
		request.getRequestDispatcher("/main.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
