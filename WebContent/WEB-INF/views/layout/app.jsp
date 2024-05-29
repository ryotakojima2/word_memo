<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>IT特化単語帳</title>
        <link rel="stylesheet" href="<c:url value='/css/app.css' /> ">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h1>ヘッダー</h1>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                仮フッター
            </div>
        </div>
    </body>
</html>
