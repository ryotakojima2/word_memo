<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <head>
        <link rel="stylesheet" href="<c:url value='/css/index.css' /> ">
    </head>
    <div id="main">
        <h2>-単語集-</h2>

        <p><a href="${pageContext.request.contextPath}/new">単語の追加</a></p>
        <p><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>

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


    </c:param>
</c:import>
