<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>学習メニュー選択</title>
</head>
<body>
    <h2>学習形式を選択してください:</h2>
    <div id="study">
            <p><a href="${pageContext.request.contextPath}/random">ランダムに出題</a></p>
             <p><a href="${pageContext.request.contextPath}/nofragment">未学習のものからランダムに出題</a></p>
               <p><a href="${pageContext.request.contextPath}/date">単語の追加順に出題</a></p>
        </div>


</body>
</html>