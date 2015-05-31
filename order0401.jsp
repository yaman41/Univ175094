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




#order {
	width: 100%;
	clear: both;
}

.row {
	background: #F2F2F2;
	border: 2px solid #efefef;
	width: 90%;
	height: 80px;
	margin: 10px;
	padding: 5px;
	line-height: 4;
	font-size: 14pt;
}

#itemname{
	font-size:15pt;
	font-weight:bold;

	margin:0px;
	float:left;
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
			<h3>■ カート一覧</h3>
			<p id="message">合計注文個数は〇〇個です 合計金額は〇〇円です</p>
			<div style="float:right; margin-right:50px;">
			<button class="button" type="submit" name="action" value="MONEY_RELOAD">金額計算</button>
			<button class="button" type="button" name="action" value="ORDER_CONFIG">注文確認</button>
			</div>
			<br style="clear:both;">
			<p id="errormessage"></p>
			<hr width="95%" align="left">
			<div id="order">
				<!-- カテゴリ一覧 -->
				<%
					for (String item : dto) {
						out.print("<div class = 'row'><p id='itemname'>" + item + "</p><div style='float:right;'> 個数: " +
								"<select name='action'>");
						for (int i = 1; i < 10; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						out.print("</select>");
						out.print("　金額 〇〇円　注文キャンセル　");
						out.print("<button class='button' type='button' name = 'action' value='ORDER_DELETE'>×</button>");
						out.print("</div></div>");
					}
				%>
			</div>
			<br style="clear: both;">
			<a href="#"><div id="topbutton"><p>TOPへ戻る</p></div></a>
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