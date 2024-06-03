<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <head>
        <link rel="stylesheet" href="<c:url value='/css/edit.css' /> ">
    </head>
        <h2>単語 : ${word.name} の編集ページ</h2>

        <form method="POST" action="${pageContext.request.contextPath}/update?id=${word.id}">
            <c:import url="update_form.jsp" />
        </form>

        <form action="${pageContext.request.contextPath}/destroy" method="post">
            <input type="hidden" name="_token" value="${_token}" />
            <input type="hidden" name="id" value="${word.id}">
            <input type="submit" value="この単語を削除する">
        </form>

        <p><a href="${pageContext.request.contextPath}/index">単語一覧に戻る</a></p>

    </c:param>
</c:import>