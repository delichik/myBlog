<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑文章 | MyBlog</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="/editormd/css/style.css" />
    <link rel="stylesheet" href="/editormd/css/editormd.css" />
    <link type="text/css" rel="stylesheet" href="/static/css/public.css" />
    <link type="text/css" rel="stylesheet" href="/static/css/add.css" />


    <script src="/editormd/js/zepto.min.js"></script>
    <script src="/editormd/js/editormd.js"></script>
    <script src="/static/js/add.js"></script>
</head>
<body>
<div class="container">
    <div id="header">
        <div>
            <h2><a href="/index.jsp">MyBlog</a> | <span style="font-size: small;"><a href="/AdminServlet">管理</a> > 编辑文章</span></h2>
        </div>
    </div>
</div>

<div class="container" id="main">

    <form action="/UpdateServlet" method="post">

        <div class="info" >
            <!-- id -->
            <span class="help">id</span>
            <input type="text" class="form-control" name="id"  value="${edit_article.id}" readonly="readonly">
            <!-- title -->
            <span class="help">标题</span>
            <input type="text" class="form-control" name="title"  value="${edit_article.title}">
            <!-- time -->
            <span class="help">时间</span>
            <input type="text"  class="form-control" name="time" value="${edit_article.time}" >
            <!-- author-->
            <span class="help">作者</span>
            <input type="text" class="form-control" name="author" value="${edit_article.author}">
            <!-- sort -->
            <span class="help">分类</span><br/>
            <c:forEach var="s"  items="${sort_count}">
                <input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;
            </c:forEach>
            <input type="text" class="form-control"  id="sort" name="sort" value="${edit_article.sort}">

            <!-- tag -->
            <span class="help">标签</span><br/>
            <c:forEach var="tag" items="${all_tag}">
                <input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
            </c:forEach>
            <input type="text" class="form-control" id="tags"  name="tags" >
        </div>


        <div class="foot_line"></div>
        <!-- content -->
        <div class="editormd" id="mdView">
            <textarea name="content">${edit_article.content}</textarea>
        </div>
        <br/>
        <input  class="btn btn-default"  type="submit"   value="提交" />
    </form>

</div>

<div class="container">
    <div class="foot_line"></div>
    <div id="footer">
        <a href="/index.jsp">MyBlog</a>
    </div>
</div>

<script type="text/javascript">
    var testEditor;
    var jQuery = Zepto;
    $(function() {
        testEditor = editormd("mdView", {
            width  : "90%",
            height : 720,
            path   : '/editormd/lib/',
            codeFold : true,
            searchReplace : true,
            saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
            htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
            emoji : true,
            taskList : true,
            tocm: true,
            tex : true,
            flowChart : true,
            sequenceDiagram : true,
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/Blog/UploadPic",
            //后台只需要返回一个 JSON 数据
            onload : function() {
                //console.log("onload =>", this, this.id, this.settings);
            }
        });
        editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用
    });
</script>

</body>
</html>