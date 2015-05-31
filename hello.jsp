<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import = "java.util.*;"

	%>
<%
	boolean status = true; // ログインステータス
	int menustatus = 1; // メニューバーステータス
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

h3{
	margin:5px;
}
.card{
	background:white;
	border:2px solid #efefef;
	float:left;
	width:200px;
	height:150px;
	margin:10px;
	padding:2px;
}

.card:hover{
	border:2px solid #9E9E9E;;
}

a:link{
	color:#444444;
}



</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
		<!-- タイトル部分 ３パターン用意 -->
			<div id="title">
				<img src="./img/logo.png" width="200" height="50"  style="float:left;">
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
					if(username != null){
						out.print("<span id = 'status'>ようこそ" + username + "さん</span>");
					}else{
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
						out.print("<a href='#'><li>>カート</li></a>");
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
			<!-- 見出し画像 -->
			<div>
				<img src = "./img/top_image.png" height="200">
			</div>
			<h3>■ カテゴリ一覧</h3>
			<div id = "category">
			<!-- カテゴリ一覧 -->
				<%
				for(String item : dto){
					out.print("<a href='#'><div class = 'card'> " +
						"<img src = './img/category1.png' height='100' width='200'>" +
						"<p>冷蔵庫...</p></div></a>");
				}
				%>
			</div>
			<br style="clear:both;">
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
	<p><%= java.util.Calendar.getInstance().getTime() %></p>
	-->
</body>
</html>