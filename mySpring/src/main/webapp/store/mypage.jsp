<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	var ownerno = "TESTOWNER01";
	function ajax() {
		var temp = "";
		$
				.ajax({
					url : "/web/mypagelist.do",
					cache : false,
					data : "ownerno=" + ownerno,
					type : "post",
					dataType : "json",
					success : function(v) {
						var OrderTotalPrice = 0;
						$(v)
								.each(
										function(index, dom) {
											OrderTotalPrice += (dom.productprice);
											temp += "<div id=\"order\" style=\"width:100%; color:black; float: left; background-color: white; font-size: 13px; padding-bottom:1.5% ; padding-top:1.5%; display: flex; border-bottom: 2px #F6F6F6 solid;\">";
											temp += "<b style=\"float: left; background-color:; flex-basis:11%;  text-align: center; font-size: 14px; color:#666666;\">"
													+ dom.no + "</b>";
											temp += "<b style=\"float: left; background-color:; flex-basis:30%;  text-align: center; font-size: 12px; color:#99B0B0;\"><img src=\"bmImage/"+dom.productcode+".jpg\"style=\"width:70px;\"><br>"
													+ dom.productname + "</b>";
											temp += "<b style=\"float: left; background-color:; flex-basis:15%; text-align: center; font-size: 14px; color:#666666;\">"
													+ dom.orderamount + "개</b>";
											temp += "<b style=\"float: left; background-color:; flex-basis:20%; text-align: center; font-size: 14px; color:#666666;\">"
													+ dom.orderdate + "</b>";
											temp += "<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; font-size: 14px; color:#666666;\">"
													+ dom.productprice
													+ "원</b>";
											if (dom.orderstatus == "배송완료") {
												temp += "<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"
													+ dom.orderstatus+"<b>";
											} else if (dom.orderstatus == "배송중") {
												temp += "<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"
														+ dom.orderstatus
														+ "<br><br><input type=\"button\" value=\"배송조회\" onclick=deleveryChk()></b>";
											}
											temp += "</div>";
										});
						$("#container").html(temp);
						$("#extendedprice").html(OrderTotalPrice);
						cartrownum(ownerno);
					},
					error : function(request, status) {
						alert("error code=" + request.status);
					}
				});
	}

	function deleveryChk() {
		window.open(
				"http://www.cjgls.co.kr/kor/service/service02_02.asp?slipno=",
				"", "width=540,height=450,top=100,left=200");
	}
	
	function cartrownum(ownerno) {
		$.ajax({
			url : '/web/cartrownum.do',
			data : 'ownerno=' + ownerno,
			type : 'post',
			success : function(v) {
				$("#cart").html(v);
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});

	}
</script>
</head>
<body onload="ajax()">
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="width: 11%; height: 600px; border:; float: left; margin-top: 10%; margin-left: 13%; font-size: 12px;">
		<div
			style="background-color:; width: 100%; padding-top: 5%; border-bottom: 1px solid gray; float: left;">
			<b style="background-color:; float: left; font-size: 17px;">마이페이지</b><br>
			<br>
		</div>
		<div
			style="background-color:; width: 100%; padding-top: 5%; border-bottom: 1px solid gray; float: left;">
			<b
				style="background-color:; float: left; font-size: 13px; font-weight: bold; margin-top: 3%; margin-bottom: 5%;">치킨
				<b style="font-size: 12px; color: gray;">님</b>
			</b><br>
			<div align="right"
				style="background-color:; width: 100%; display: block; display: flex; margin-top: 3%;">
				<b
					style="background-color:; text-align: left; font-size: 12px; font-weight:; color: gray; flex-grow: 1;">총구매액</b><br>
				<b
					style="background-color:; text-align: right; font-size: 12px; font-weight:; color:  rgb(70, 205, 223); flex-grow: 3;"
					id="extendedprice"></b>원<br>
			</div>
			<div align="right"
				style="background-color:; width: 100%; display: block; display: flex; margin-top: 3%; margin-bottom: 5%">
				<b
					style="background-color:; text-align: left; font-size: 12px; font-weight:; color: gray; flex-grow: 1;">장바구니</b><br>
				<b
					style="background-color:; text-align: right; font-size: 12px; font-weight:; color:  rgb(70, 205, 223); flex-grow: 3;"
					id="cart"></b>개<br>
			</div>
		</div>
	</div>
	<div
		style="width: 58%; height: 500px; background-color:; float: left; margin-top: 10%; margin-left: 7%;">
		<div
			style="float: left; background-color: white; width: 70%; margin-bottom: 3%;">
			<b style="font-size: 25px;">주문내역 · 배송조회</b>
		</div>
		<div
			style="float: left; width: 100%; background-color: white; border-top: 1px solid gray; border-bottom:; display: block;">
			<div
				style="width: 100%; color: #99B0B0; float: left; background-color: #F6F6F6; font-size: 13px; padding-bottom: 1.5%; padding-top: 1.5%; display: flex;">
				<b
					style="float: left; background-color:; flex-basis: 11%; text-align: center;">주문번호</b>
				<b
					style="float: left; background-color:; flex-basis: 30%; text-align: center;">주문상품</b>
				<b
					style="float: left; background-color:; flex-basis: 15%; text-align: center;">주문수량</b>
				<b
					style="float: left; background-color:; flex-basis: 20%; text-align: center;">주문일시</b>
				<b
					style="float: left; background-color:; flex-basis: 11%; text-align: center;">주문금액</b>
				<b
					style="float: left; background-color:; flex-grow: 1; text-align: center;">배송정보</b>
			</div>
			<span id="container"> </span>
		</div>
	</div>
</body>
</html>