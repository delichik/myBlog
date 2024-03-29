<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh_CN">
<head>
    <title>分类 - ${title}</title>
    <jsp:include page="part/front.jsp"/>
</head>

<body>
<jsp:include page="part/header.jsp">
    <jsp:param value="1" name="current_index"/>
</jsp:include>

<div class="container vc-container">
    <div class="row">
        <div class="col-sm-12 col-md-9">
            <c:forEach var="map" items="${sort_article_map}" varStatus="i">
                <div class="thumbnail">
                    <div class="sort_name">
                        <span id="title-${i.index}" class="toggle-button glyphicon glyphicon-triangle-bottom"></span>
                            ${map.key}
                    </div>
                    <div class="caption">
                        <ul class="list-group" id="list-${i.index}">

                            <c:forEach var="list" items="${map.value}">
                                <li class="list-group-item">
                                    <div>
                                        <a href="/article?id=${list.id}">${list.title}</a>
                                        <div class="clearfix pull-right">
                                            <time>${list.time}</time> &bull; <span>${list.visit}次浏览</span>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="part/sideinfo.jsp"/>
    </div>
</div>
<jsp:include page="part/footer.jsp"/>
<jsp:include page="part/tail.jsp"/>
<script type="text/javascript" src="/static/js/toggle.js"></script>
</body>

</html>