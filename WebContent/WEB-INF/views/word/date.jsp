<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/app.jsp">
<c:param name="content">
<head>
    <meta charset="UTF-8">
    <title>ランダムなレコード表示</title>
</head>
    <div id="header">
    </div>
    <h2>ランダムなレコード</h2>
    <c:if test="${not empty date}">
        <p>単語: ${date.name}</p>

              <!-- 意味を表示する部分 -->
        <p>意味: ${meaning}</p>

        <form action="meaningd" method="post">
            <input type="hidden" name="id" value="${date.id}">
            <input type="submit" value="意味を表示">
        </form>

        <form action="checkboxd" method="post">
            <input type="hidden" name="id" value="${date.id}">
            <%-- データベースのfragmentの値が1の場合、チェックボックスをチェック済みにする --%>
            <input type="checkbox" name="fragment" value="1" ${date.fragment == 1 ? 'checked' : ''}> 学習済み<br>
            <input type="hidden" name="fragment" value="0">
            <input type="submit" value="覚えた！">
        </form>


          <form action="nextrecordd" method="get">

            <input type="hidden" name="id" value="${date.id}">
        <input type="submit" value="次へ">
        </form>
    </c:if>
    <c:if test="${empty date}">
        <p>すべての単語を学習しました。</p>
    </c:if>

    <p><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>

    <div id="footer">
    </div>
</c:param>
</c:import>