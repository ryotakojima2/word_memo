<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ランダムなレコード表示</title>
</head>
<body>
    <h2>ランダムなレコード</h2>
    <c:if test="${not empty randomRecord}">
        <p>単語: ${randomRecord.name}</p>
        <form action="meaning" method="post">
            <input type="hidden" name="id" value="${randomRecord.id}">
            <input type="submit" value="意味を表示">
        </form>
        <form action="checkbox" method="post">
            <input type="hidden" name="id" value="${randomRecord.id}">
            <input type="checkbox" name="checkbox"> チェック
            <input type="submit" value="送信">
        </form>

        <form action="nextrecord" method="post">
            <input type="hidden" name="id" value="${randomRecord.id}">
            <input type="submit" value="次へ">
        </form>
    </c:if>
    <c:if test="${empty randomRecord}">
        <p>ランダムなレコードが見つかりませんでした。</p>
    </c:if>

    <p><a href="${pageContext.request.contextPath}/home">ホームへ戻る</a></p>
</body>
</html>