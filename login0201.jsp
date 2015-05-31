<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*;"%>
<%
	boolean status = true; // ログインステータス
	int menustatus = 3; // メニューバーステータス
	String username = null;//"univ"; // ユーザー名
	ArrayList<String> dto = new ArrayList<String>();
	dto.add("aaa");
	dto.add("bbb");
	dto.add("ccc");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sample jsp</title>
<link rel="stylesheet" href="./css/style.css" type="text/css">
<style>
/***************************
	-- コンテンツ部分 --
****************************/
#message {
	width: 400px;
	float: left;
}

#login{
	width:500px;
	margin:0 auto;
}

#login p{
	margin:2px 5px;
}


td{
	text-align:right;
	vertical-align:middle;
}

.inputform {
	border: 0;
	padding: 10px;
	color: #aaa;
	border: solid 1px #ccc;
	margin: 0 0 10px;
	width: 300px;
	-moz-box-shadow: inset 1px 4px 9px -6px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: inset 1px 4px 9px -6px rgba(0, 0, 0, 0.5);
	box-shadow: inset 1px 4px 9px -6px rgba(0, 0, 0, 0.5);
}

#submitform{
	display:block;
	float:right;
	margin-right:70px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<!-- タイトル部分 ３パターン用意 -->
			<div id="title">
				<img src="./img/logo.png" width="200" height="50" id = "logo">
				<%
					// ログインしているかどうかによってログインボタンを変更
					if (status == true) {
						out.print("<a href = '#'><div id = 'logoutbutton' class='statusbutton'>Logout</div></a>");
					} else {
						out.print("<a href = '#'><div id = 'logintbutton' class='statusbutton'>Login</div></a>");
					}
				%>
				<%
					// ログインしているかどうかによってログイン名を変更
					if (username != null) {
						out.print("<span id = 'status'>ようこそ" + username + "さん</span>");
					} else {
						out.print("<span id = 'status'>ようこそゲストさん</span>");
					}
				%>

			</div>

			<div id="menu">
				<ul>
					<%
					if (menustatus == 1) {
						// ログインしている状態のメニューバー
						out.print("<a href='#'><li>カテゴリ一覧</li></a>");
						out.print("<a href='#'><li>注文一覧</li></a>");
						out.print("<a href='#'><li>カート</li></a>");
						out.print("<a href='#'><li>ユーザ情報表示</li></a>");
					} else if (menustatus == 2) {
						// ログインしていない状態のメニューバー
						out.print("<a href='#'><li>カテゴリ一覧</li></a>");
						out.print("<a href='#'><li>新規登録</li></a>");
					} else if(menustatus == 3) {
						//
						out.print("<a href='#'><li>カテゴリ一覧</li></a>");
					}else{
						// 何も表示しない
					}
					%>
				</ul>
			</div>
		</div>
		<div id="content">
			<!-- メイン部分 -->
			<h3>■ ログイン</h3>
			<div id="login">
				<form action="#" method="POST">
					<table>
						<tr>
						<td>ユーザID:　</td><td><input type="text" name="USERID" class="inputform"></td></tr>
						<tr>
						<td>パスワード:　</td><td><input type="password" name="PASSWORD" class="inputform"></td></tr>
					</table>
					<input type="submit" value="送信" id="submitform" class="button">
				</form>
				<br><br><br>
				<br style="clear:both">
				<p>※ユーザIDやパスワードを忘れた方はこちらにご連絡下さい</p>
				<a href="#"><p>hogehoge@domain.co.jp</p></a>
			</div>
			<br style="clear: both;">
		</div>
		<div id="footer">
			<!-- 最下部 -->
			<p></p>
			<p></p>
			<p>Copyright &copy; 2015 univcompany All Rights Reserved.</p>
		</div>
	</div>

	<!--
	<h1>Sample jsp page</h1>
	<p>これはサンプルで用意したページです。</p>
	<p><%=java.util.Calendar.getInstance().getTime()%></p>
	-->
</body>
</html>