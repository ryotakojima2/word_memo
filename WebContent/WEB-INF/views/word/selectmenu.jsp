<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <head>
        <meta charset="UTF-8">
        <title>学習メニュー選択</title>
        <link rel="stylesheet" href="<c:url value='/css/selectmenu.css' /> ">
    </head>
        <p id="back"><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>

        <div id="main">
        <h3>学習形式を選択してください:</h3>
            <div id="study">
                <p><a href="${pageContext.request.contextPath}/random">ランダムに出題</a></p>
                <p><a href="${pageContext.request.contextPath}/nofragment">未学習のものからランダムに出題</a></p>
                <p><a href="${pageContext.request.contextPath}/date">単語の追加順に出題</a></p>
            </div>
        </div>
    </c:param>
</c:import>