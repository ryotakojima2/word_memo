<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">

    <head>
        <link rel="stylesheet" href="<c:url value='/css/showCategory.css' /> ">
    </head>
        <h2>ジャンル:${category.categoryName} の詳細ページ</h2>
        <ul>
            <c:choose>
                <c:when test="${empty words}">
                    <p>まだ未登録です。</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="word" items="${words}">
                        <li>
                            <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                                <c:out value="${word.name}"/>
                            </a>
                        </li>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>

        <p><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>


    </c:param>
</c:import>
