<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>首页 | MyBlog</title>

	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

	<link type="text/css" rel="stylesheet" href="/static/css/public.css" />
	<link type="text/css" rel="stylesheet" href="/static/css/main.css" />
</head>
<body>
<div class="head_line"></div>


<div class="container" id="main">

	<div id="header"></div>

	<div class="row c_center">
		<div class="col-md-3" id="left_content">

			<div id="title">
				<h2><a href="/login.html">MyBlog</a></h2>
				<h5 class="text-muted">${subtitle}</h5>
			</div>

			<div class="c_center" id="person_info">
				<img src="${head_img}" height="130" width="130"
					 alt="丢失了我的头像?" class="img-circle">
				<h4 class="text-muted">${name}</h4>
				<h5 class="text-muted">${sign}</h5>
			</div>

			<div class="c_center">
				<!-- 这里初始化侧边栏的4个标签 -->
				<div class="inline">
					<a href="#">${article_number}<br/>日志</a>
				</div>
				<div class="inline">
					<a href="/SortServlet?get=all"><span>${sort_number} </span><br/>分类</a>
				</div>
				<div class="inline" >
					<a href="/TagsServlet?get=all"><span>${tags_number}</span><br/>标签</a>
				</div>
			</div>


			<div id="list">
				<table class="table table-hover c_center">
					<tr class="active">
						<td><a href="/index.jsp"><span class="glyphicon glyphicon-home"></span>
							首页</a></td>
					</tr>
					<tr>
						<td><a href="/SortServlet?get=all"><span class="glyphicon glyphicon-list"></span>
							分类</a></td>
					</tr>
					<tr>
						<td><a href="/TagsServlet?get=all"><span class="glyphicon glyphicon-tags"></span>
							标签</a></td>
					</tr>
					<tr>
						<td><a href="/AxisServlet"><span class="glyphicon glyphicon-book"></span>
							时间轴</a></td>
					</tr>
					<tr>
						<td><a href="/about.html"><span class="glyphicon glyphicon-user"></span>
							关于</a></td>
					</tr>


					<!-- admin here -->
					<c:if test="${sessionScope.user!=null}">

						<tr>
							<td><a href="/AdminServlet"><span class="glyphicon glyphicon-user"></span>
								管理</a></td>
						</tr>
					</c:if>
					<!--  -->
				</table>
			</div>
			<!-- list -->
			<br/>

			<div class="sort">
				<div class="list-group">
					<span class="list-group-item active">分类</span>
					<!-- 这里初始化分类 -->
					<c:forEach var="entity"  items="${sort_count_map}">
						<a href="/SortServlet?get=${entity.key}" class="list-group-item">${entity.key}&nbsp;&nbsp;&nbsp;&nbsp; (${entity.value})</a>
					</c:forEach>
					<!-- 初始化结束 -->
				</div>
			</div><!-- sort -->

			<div class="visit">
				<div class="list-group">
					<span class="list-group-item active">阅读排行</span>
					<!-- 这里初始化阅读排行 -->
					<c:forEach var="a"  items="${visit_rank}">
						<a href="/ArticleServlet?id=${a.id}" class="list-group-item">${a.title}&nbsp;&nbsp; <span class="c_right">(${a.visit})</span></a>
					</c:forEach>
					<!-- 初始化结束 -->
				</div>
			</div><!-- visit-->

			<div id="tag" style="margin-top: 0 !important;">
				<div class="list-group">
					<span class="list-group-item active">标签</span>
					<br/>

					<!-- 这里初始化标签 -->
					<c:forEach var="t"  varStatus="status" items="${tag_list}" >
						<c:choose>
							<c:when test="${status.count%2==1}">
							<span class="label label-info"><a href="/TagsServlet?get=${t.tag}">
							&nbsp;${t.tag}&nbsp;</a></span>
							</c:when>
							<c:otherwise>
								<span class="label label-success"><a href="/TagsServlet?get=${t.tag}">
								&nbsp;${t.tag}&nbsp;</a></span>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-md-2" id="center_content">
		</div>
		<div  class="col-md-7 " id="right_Content">
			<br />
			<br />
			<div class="list-group">
				<a href="#" class="list-group-item active">文章</a>
				<!-- 这里初始化文章列表 -->
				<c:forEach var="article"   items="${article_list}" >
					<div  class="list-group-item">
						<h4><a href="/ArticleServlet?id=${article.id}">${article.title}</a></h4>
						<span>${article.time}&nbsp;|&nbsp;</span>
						<a href="/SortServlet?get=${article.sort}">${article.sort}</a>&nbsp;|&nbsp;
						<span>阅读次数: ${article.visit}</span>
						<br/>
						<br/>
						<br/>
						<span>${article.content}</span>
						<a href="/ArticleServlet?id=${article.id}">阅读全文</a>
						<br/>
						<br/>
						<br/>
					</div>
				</c:forEach>
				<!-- 初始化文章列表完成 -->
			</div>
		</div>
	</div>
</div><!-- container -->

<div class="container">
	<div class="foot_line"></div>
	<div id="footer">
		<h6> 被访问了 ${visited } 次，你是第 ${member}个访问者</h6>
		By MLQS team | with <a target="_blank" href="https://blog.imiku.moe/">iMIKU.moe</a> &reg;
	</div>
</div>
</body>
</html>