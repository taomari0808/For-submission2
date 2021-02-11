<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>激辛SNS</title>
<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div id="header_menu">
                <h1>
                    <a href="<c:url value='/' />">激辛Eats</a>
                </h1>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.login_contributor != null}">
                    <c:if test="${sessionScope.login_contributor.admin_flag == 1}">
                        <a href="<c:url value='/contributors/index' />">投稿者</a>&nbsp;
                        </c:if>
                    <a href="<c:url value='/reports/index' />">投稿記事</a>&nbsp;
                    </c:if>
            </div>
            <c:if test="${sessionScope.login_contributor != null}">
                <div id="contributor_name">
                    <c:out value="${sessionScope.login_contributor.name}" />
                    &nbsp;さん&nbsp;&nbsp;&nbsp; <a href="<c:url value='/logout' />">ログアウト</a>
                </div>
            </c:if>
        </div>
        <div id="content">${param.content}</div>
        <div id="footer">by Marina Tao.</div>
    </div>

</body>
</html>