<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:import url="../layout/app.jsp">
    <c:param name="content">

        <h2>id : ${word.id} のメッセージ詳細ページ</h2>

        <p>単語：<c:out value="${word.name}" /></p>
        <p>意味：<c:out value="${word.mean}" /></p>

<c:if test="${word.fragment == 1}">
    <p>学習済み</p>
</c:if>
<c:if test="${word.fragment == 0}">
    <p>未学習</p>
</c:if>

        <p>作成日時：<fmt:formatDate value="${word.date}" pattern="yyyy-MM-dd HH:mm:ss" /></p>


        <p><a href="${pageContext.request.contextPath}/index">単語一覧</a></p>
        <p><a href="${pageContext.request.contextPath}/edit?id=${word.id}">編集する</a></p>

        <form action="destroy" method="post">
            <input type="hidden" name="id" value="${word.id}">
            <input type="submit" value="この単語を削除する">
        </form>

    </c:param>
</c:import>