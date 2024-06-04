<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <head>
        <link rel="stylesheet" href="<c:url value='/css/index2.css' /> ">
    </head>
    <p id="back"><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>
    <h2>-単語集-</h2>
    <div id="main">
        <p id="new"><a href="${pageContext.request.contextPath}/new">単語の追加</a></p>

        <ul>
            <c:forEach var="word" items="${words}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                        <c:out value="${word.name}"/>
                    </a>
                </li>
            </c:forEach>
        </ul>

    </div>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <div id="pagetop"><a href="#top"><i class="fas fa-arrow-up"></i></a></div>


    </c:param>
</c:import>
