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

	ArrayList<CartDTO> list = (ArrayList<CartDTO>)session.getAttribute("CartDTOList");
	int sum = 0;
	for(CartDTO cart : list){
		sum += cart.getTotalprice();
	}

	UserDTO user = new UserDTO(1);
	session.setAttribute("UserDTO", user);

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
			<h3>■ 注文確認</h3>
			<c:if test="${CartDTOList != null && CartDTOList.size() != 0}">
				<p id="message">合計注文個数は${CartDTOList.size()}個です 合計金額は<% out.print(sum); %>円です</p>
				<div style="float:right; margin-right:50px;">
				<form action="http://localhost:8080/workshop/controler" method="POST">
				<input type="hidden" name="action" value="RPU0402_Order">
				<button class="button" type="submit" name="confirm" onClick="action.value='RPU0405_Order'">注文</button>
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
							<div style="float:right;">個数：${dto.count}
							金額：${dto.totalprice }円

							</div>
						</div>
					</c:forEach>
				</c:if>

			</div>
			<br style="clear: both;">
			<div style="float:right; margin-right:20px;">
			<button class="button" type="submit" name="confirm" onClick="action.value='RPU0405_Order'">前画面に戻る</button> <button class="button" type="submit" name="confirm" onClick="action.value='RPU0405_Order'">注文</button>
			</div>
			<br style="clear: both;">
			</form>
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