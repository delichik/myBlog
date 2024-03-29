package dev.mlqs.myblog.utils;

import java.util.List;

import dev.mlqs.myblog.model.Article;
import dev.mlqs.myblog.model.AxisArticle;


public class ArticleUtils {

	
	public static List cutTime(List<Article> list) {

		for (Article a : list) {
			a.setTime(a.getTime().substring(0, 11));
		}

		return list;
	}

	
	public static Article cutTime(Article a) {
		a.setTime(a.getTime().substring(0, 11));
		return a;
	}

	
	public static List cutContent(List<Article> list) {

		for (Article a : list) {
			if (a.getContent() != null && a.getContent().length() > 351) {
				a.setContent(a.getContent().substring(0, 349) + "...");
			}
		}
		return list;
	}

	
	public static AxisArticle getAxisArticle(Article article) {

		AxisArticle axisArticle = new AxisArticle();

		axisArticle.setTitle(article.getTitle());
		axisArticle.setId(article.getId());

		
		String year = StringUtils.cutString(article.getTime(), 0, 4);
		String month = StringUtils.cutString(article.getTime(), 5, 7);
		String day = StringUtils.cutString(article.getTime(), 8, 10);

		axisArticle.setYear(Integer.valueOf(year));
		axisArticle.setMonth(Integer.valueOf(month));
		axisArticle.setDay(Integer.valueOf(day));

		return axisArticle;
	}
}
