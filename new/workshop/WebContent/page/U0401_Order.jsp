<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.*, univelec.dto.*"
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

	/*
	if(session.getAttribute("CartDTOList") == null){
	ArrayList<CartDTO> cartlist = new ArrayList<CartDTO>();
	cartlist.add(new CartDTO(1,"SHARP Mebius", 75000, 1, 100, 1));
	cartlist.add(new CartDTO(2, "東芝ｄｙｎａｂｏｏｋ", 85000, 1, 40, 1));
	cartlist.add(new CartDTO(3, "Sony VAIO", 115000, 1, 100, 15));
	session.setAttribute("CartDTOList", cartlist);
	}*/

%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sample jsp</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
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
	width: 95%;
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
			<c:if test="${CartDTOList != null && CartDTOList.size() != 0}">
				<p id="message">合計注文個数は〇〇個です 合計金額は〇〇円です</p>
				<div style="float:right; margin-right:50px;">
				<form action="http://localhost:8080/workshop/controler" method="POST">
				<input type="hidden" name="action" value="RPU0402_Order">
				<button class="button" type="submit" name="price" onClick="action.value='RPU0402_Order'">金額計算</button>
				<button class="button" type="submit" name="confirm" onClick="action.value='RPU0403_Order'">注文確認</button>
				</div>
			</c:if>
			<c:if test="${CartDTOList == null || CartDTOList.size() == 0}">
				<p>現在カートに格納されている商品はありません</p>
			</c:if>

			<br style="clear:both;">
			<p id="errormessage">${ErrorMessage}</p>
			<hr width="95%" align="left">
			<div id="order">
				<!-- カテゴリ一覧 -->
				<c:if test="${CartDTOList != null }">
					<c:forEach items = "${CartDTOList}" var ="dto" varStatus = "row">
						<div class ="row">

							<p id = "itemname">${row.index+1}. ${dto.itemname}</p>
							<div style="float:right;">個数：
							<select name ="selectnums">
								<c:forEach begin="1" end="${dto.stock}" var="count">
									<option value="${count}" <c:if test="${dto.count == count}"> selected </c:if>>${count}</option>
								</c:forEach>
							</select>
							金額：${dto.totalprice }円
							注文キャンセル <button class="minibutton" type="submit" name = "index" value="${row.index}" onClick="action.value='RPU0404_Order'">×</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
				</form>
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