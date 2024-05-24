<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<label for="Name">単語</label><br />
<input type="text" name="name" id="name" value="${word.name}" />
<br /><br />

<label for="Mean">意味</label><br />
<input type="text" name="mean" id="mean_msg" value="${word.mean}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">追加</button>