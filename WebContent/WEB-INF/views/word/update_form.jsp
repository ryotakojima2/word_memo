<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<button type="submit">更新</button>
