<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>-単語集-</h2>
        <ul>
            <c:forEach var="word" items="${words}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                        <c:out value="${word.name}"/>
                    </a>
                </li>
            </c:forEach>
        </ul>

        <p><a href="${pageContext.request.contextPath}/new">単語の追加</a></p>
        <p><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>


    </c:param>
</c:import>

