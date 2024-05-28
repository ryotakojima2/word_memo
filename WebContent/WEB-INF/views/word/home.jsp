<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <head>
    <link rel="stylesheet" href="<c:url value='/css/style.css' /> ">
    </head>
        <h2>IT特化単語帳</h2>
        <div id="title">
            <p><a href="${pageContext.request.contextPath}/random">学習する</a></p>
        </div>
    <div id="wrapper">
        <div id="header">
            <h3><a href="${pageContext.request.contextPath}/index">単語一覧</a></h3>
            <ul>
                <c:forEach var="word" items="${words}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                            <c:out value="${word.name}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div id="content">
            <h3>ジャンル一覧</h3>
            <ul>

                <c:forEach var="category" items="${categorys}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${category.categoryId}">
                            <c:out value="${category.categoryName}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    </c:param>
</c:import>