<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>IT単語帳アプリ</title>
    <link rel="stylesheet" href="<c:url value='/css/home2.css' /> ">
</head>
<body>
    <h2 id="headerTitle">IT単語帳</h2>
    <div id="header">
        <div id="study">
            <p><a href="${pageContext.request.contextPath}/selectmenu">学習する</a></p>
        </div>
    </div>
    <div id="main">
    <h4>メニュー</h4>

        <div id="index">
                <h3>単語一覧</h3>
            <ul>
                <c:forEach var="word" items="${words}" varStatus="loop">
                <c:if test="${loop.index < 6}">
                    <li>
                        <a href="${pageContext.request.contextPath}/show?id=${word.id}">
                            <c:out value="${word.name}"></c:out>
                        </a>
                    </li>
                </c:if>
                </c:forEach>
            </ul>
            <p id="toindex"><a href="${pageContext.request.contextPath}/index">単語一覧へ</a></p>
        </div>

        <div id="category">
            <h3>ジャンル一覧</h3>
            <ul>
                <c:forEach var="category" items="${categorys}">
                    <li>
                        <a href="${pageContext.request.contextPath}/showcategory?categoryId=${category.categoryId}">
                            <c:out value="${category.categoryName}"></c:out>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>

    </div>
    <div id="footer">
    </div>

    <script>
        const colors = ["#ffffff", // 白
            "#f0faff",
            "#e1f5ff",
            "#d1f0ff",
            "#c2ebff",
            "#b2e6ff",
            "#a3e1ff",
            "#93dcff",
            "#84d7ff",
            "#74d2ff",
            "#65cdff",
            "#55c8ff",
            "#46c3ff",
            "#36beff",
            "#27b9ff",
            "#17b4ff",
            "#08afff",
            "#00aaff",
            "#009fff",
            "#0094ff",
            "#00aaff",
            "#08afff",
            "#17b4ff",
            "#27b9ff",
            "#36beff",
            "#46c3ff",
            "#55c8ff",
            "#65cdff",
            "#74d2ff",
            "#84d7ff",
            "#93dcff",
            "#a3e1ff",
            "#b2e6ff",
            "#c2ebff",
            "#d1f0ff",
            "#e1f5ff",
            "#f0faff",
            "#ffffff",
        ];
        let index = 0;

        function changeTitleColor() {
            const title = document.getElementById('headerTitle');
            title.style.color = colors[index];
            index = (index + 1) % colors.length;
        }

        setInterval(changeTitleColor, 100); // h2の色を0.5秒ごとに変更
    </script>
</body>
</html>