<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>IT特化単語帳</h2>

        <p><a href="${pageContext.request.contextPath}/stady">学習する</a></p>

        <div>
            <h3><a href="${pageContext.request.contextPath}/index">単語一覧</a></h3>
            <ul>
                <c:forEach var="word" items="${words}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                            ・<c:out value="${word.name}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div>
            <h3>ジャンル一覧</h3>
            <ul>
                <c:forEach var="category" items="${categorys}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${category.categoryId}">
                            ・<c:out value="${category.categoryName}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <p><a href="${pageContext.request.contextPath}/edit">ジャンルの編集</a></p>
        </div>

    </c:param>
</c:import>