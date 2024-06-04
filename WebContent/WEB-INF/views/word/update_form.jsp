<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<link rel="stylesheet" href="<c:url value='/css/form.css' /> ">

<label for="Name">単語</label><br />
<input type="text" name="name" id="name" value="${newword.name}" />
<br /><br />

<label for="Mean">意味</label><br />
<input type="text" name="mean" id="mean_msg" value="${newword.mean}" />
<br /><br />

<label for="Category">ジャンル</label><br />
<select name="category" id="category_msg">
  <option value="" disabled selected>選択してください</option>
  <c:forEach var="category" items="${categories}">
      <option value="${category.categoryId}"><c:out value="${category.categoryName}" /></option>
  </c:forEach>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />

<button type="submit" onclick="validateForm(event)">更新</button>

<script>
    function validateForm(event) {
        var name = document.getElementById('name').value.trim();
        var mean = document.getElementById('mean_msg').value.trim();
        var category = document.getElementById('category_msg').value;

        if (name === '' || mean === '' || category === '') {
            alert('全ての項目を入力してください。');
            event.preventDefault();
        } else {
            // ここにフォーム送信の処理を追加する場合、コメントを外してください
            // document.getElementById('form_id').submit();
        }
    }
</script>