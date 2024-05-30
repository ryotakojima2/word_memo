<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>IT特化単語帳</title>
    <link rel="stylesheet" href="<c:url value='/css/home2.css' /> ">
</head>
<body>
    <h2>IT特化単語帳</h2>
    <div id="header">
        <div id="study">
            <p><a href="${pageContext.request.contextPath}/random">学習する</a></p>
        </div>
    </div>
    <div id="main">
    <h4>メニュー</h4>

        <div id="index">
                <h3><a href="${pageContext.request.contextPath}/index">単語一覧へ</a></h3>
            <ul>
                <c:forEach var="word" items="${words}" varStatus="loop">
                <c:if test="${loop.index < 6}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                            <c:out value="${word.name}"></c:out>
                        </a>
                    </li>
                </c:if>
                </c:forEach>
            </ul>
        </div>

        <div id="category">
            <h3>ジャンル一覧</h3>
            <ul>
                <c:forEach var="category" items="${categorys}">
                    <li>
                        <a href="${pageContext.request.contextPath}/showcategory?categoryId=${category.categoryId}">
                            <c:out value="${category.categoryName}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>

    </div>
    <div id="footer">
    </div>
</body>
</html>