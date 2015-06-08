<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import = "java.util.*, univelec.dto.*"

	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
	boolean status = true; // ログインステータス
	int menustatus = 1; // メニューバーステータス
	String username = null;//"univ"; // ユーザー名
	ArrayList<String> dto = new ArrayList<String>();
	dto.add("aaa");
	dto.add("bbb");
	dto.add("ccc");

	ArrayList<ItemDTO> itemlist = new ArrayList<ItemDTO>();
	itemlist.add(new ItemDTO(1,"SHARP Mebius", 75000, 1, 100));
	itemlist.add(new ItemDTO(2, "東芝ｄｙｎａｂｏｏｋ", 85000, 1,90));
	itemlist.add(new ItemDTO(3, "Sony VAIO", 115000, 1, 100));
	itemlist.add(new ItemDTO(4, "IBM Thinkpad" ,155000, 1, 80));

	session.setAttribute("ItemDTOList", itemlist);
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

#category {
	width: 100%;
	clear: both;
}

.row {

	width: 95%;
	height: 80px;
	margin: 10px;
	padding: 5px;
	line-height: 4;
	font-size: 14pt;

	border-bottom:1px dashed #727272;
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
			<h3>■ カテゴリ1</h3>
			<form action ="/workshop/controler" method="POST">
				<input type="hidden" name="action" value="RPU0401_Order">
				<input type="hidden" name="count" value="5">
				<button type="submit" name="itemindex" value="1" class="button" onClick="action.value='RPU0401_Order'">カートに入れる</button>
			</form>
			<p>${ErrorMessage }</p>
			<div id="category">

				<c:forEach items = "${ItemDTOList}" var ="dto" varStatus = "row">
					<form action ="/workshop/controler"  method="POST">
						<input type="hidden" name="action" value="RPU0401_Order">
						<div class ="row">
							<p id = "itemname">${row.index+1}. ${dto.name}</p>
							金額：${dto.price }円
							<div style="float:right;">個数：
							<select name ="count">
								<c:forEach begin="1" end="${dto.stock}" var="count">
									<option value="${count}">${count}</option>
								</c:forEach>
							</select>
							/${dto.stock}
							 <button class="minibutton" type="submit" name = "itemindex" value="${row.index}" >カートに入れる</button>
							</div>
						</div>
						</form>
					</c:forEach>
				<!-- カテゴリ一覧 -->
				<%
					int j = 0;
					for (ItemDTO item : itemlist) {
						out.print("<div class = 'row'><p id='itemname'>" + item.getName() + "</p><div style='float:right;'>" +
						          "<form action='/workshop/controler' method='POST'><input type='hidden' name='action' value='RPU0401_Order'>  価格 〇〇円　個数: " +
								"<select name='itemnums'>");
						for (int i = 1; i < 100; i++) {
							out.print("<option name = 'count' value='" + i + "'>" + i + "</option>");
						}
						out.print("</select>");
						out.print(" /10　");
						out.print("<input type='hidden' name='itemindex' value='"+ j + "'><input class='button' type='submit' value='カートに入れる'></form>");
						out.print("</div></div>");
						j++;
					}
				%>
			</div>
			<br style="clear: both;">
			<div style="float:right; width:500px;">
			<a href="#"><div class="backbutton"><p>TOPへ戻る</p></div></a>
			<a href="#"><div class="backbutton"><p>カテゴリ一覧</p></div></a>
			<a href="#"><div class="backbutton"><p>カート</p></div></a>
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
	<p><%= java.util.Calendar.getInstance().getTime() %></p>
	-->
</body>
</html>