<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>IT特化単語帳</title>
        <link rel="stylesheet" href="<c:url value='/css/app.css' /> ">
    </head>
    <body>
            <div id="header">
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
            </div>
    </body>
</html>
