<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*;"%>
<%
	boolean status = true; // ログインステータス
	int menustatus = 1; // メニューバーステータス
	String username = null;//"univ"; // ユーザー名
	ArrayList<String> dto = new ArrayList<String>();
	dto.add("aaa");
	dto.add("bbb");
	dto.add("ccc");
	int today = 1;
	int orderday = 1;
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

h3 {
	margin: 5px;
}

#orderdisplay{
	width:850px;
	margin:0 auto;
}



table {
	bborder-collapse: collapse;
	border-spacing: 0;
	text-align: center;
	border: 1px solid #e3e3e3;
}

table th,td {
	border: #E3E3E3 solid;
	border-width: 0 0 1px 1px;
}

table th {
	background: #efefef;
}

table td{
	text-align:center;
	height:50px;
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
			<h3>■ 注文履歴一覧</h3>
			<div id="orderdisplay">
				<table>
					<tr>
						<th>注文番号</th>
						<th style="width:300px;">商品名</th>
						<th>注文数</th>
						<th style="width:200px;">注文日時</th>
						<th style="width:200px;"></th>
					<tr>
						<%
							for (int i = 0; i < 10; i++) {
								out.print("<tr><td>" + i + "</td><td>aa</td><td>2</td><td>yyyy/mm/dd</td>");
								if (orderday < today) {
									// 前日以前の注文はキャンセルできない
									out.print("<td></td>");
								} else {
									// 当日の注文はキャンセルできる
									out.print("<td><button type='button' class='button'>注文キャンセル</button></td>");
								}
								out.print("</tr>");
							}
						%>

				</table>
				<p>※注文キャンセルは当日中に注文した商品に限らせていただきます</p>
			</div>
			<br style="clear: both;">

			<a href="#"><div id="topbutton">
					<p>TOPへ戻る</p>
				</div></a> <br style="clear: both;">
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