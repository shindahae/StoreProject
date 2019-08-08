<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리추로 상회</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<link rel="stylesheet" type="text/css" href="bmcss.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	function ajaxList(url, dataType) {
		var temp = '';
		$
				.ajax({
					type : 'POST',
					url : url,
					dataType : dataType,
					success : function(v) {
						$(v)
								.each(
										function(index, dom) {
											temp += "<div style=\"float: left; width: 200px; height: 400px;margin-left: 7%;\">";
											temp += "<a href=\"/web/detail.do?no="
													+ dom.no
													+ "\"><img alt=\"\" src=\"bmImage/"+dom.productimage+".jpg\" width=\"260px\" height=\"300px\"></a>";
											temp += "<div style=\"width: 100%; background-color: white; margin-top: 2%;\">";
											temp += "<b>" + dom.productname
													+ "</b></div>"
											temp += "<div style=\"width: 100%; margin-top: 2%; margin-bottom: 18%;\">";
											temp += "<img alt=\"\" src=\"best.gif\">";
											temp += "<font style=\"float: right; font-size:0.8em;\">"
													+ dom.productunit
													+ "</font><br>";
											temp += "<b style=\"float: right; border-bottom: 3px solid black;\">"
													+ dom.priceView + "</b>";
											temp += "</div></div></div>";
										});
						$("div#pdiv").html(temp);
						ajaxSelectList(
								'/web/mainSelectItem.do?category=chicken',
								'json');
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}
	function ajaxSelectList(url, dataType) {
		var temp = '';
		$
				.ajax({
					type : 'POST',
					url : url,
					dataType : dataType,
					success : function(v) {
						$(v)
								.each(
										function(index, dom) {
											if (index == 0) {
												temp += "<div style=\"margin-top: 5%; margin-left: 10%; width: 150px; height: 200px; float: left;\">";
												temp += "<a href=\"/web/detail.do?no="
														+ dom.no
														+ "\"><img src=\"bmImage/"+dom.productimage+".jpg\" style=\"width: 150px; height: 150px;\"></a>";
												temp += "<b style=\"color: white; font-size: 14px;\">"
														+ dom.productname
														+ "</b><br>";
												temp += "<b style=\"color: white; font-size: 18px;\">"
														+ dom.priceView
														+ "</b></div>";
											} else {
												temp += "<div style=\"margin-top: 5%; margin-right: 7%; width: 150px; height: 200px;float: right;\">";
												temp += "<a href=\"/web/detail.do?no="
														+ dom.no
														+ "\"><img src=\"/web/bmImage/"+dom.productimage+".jpg\"	style=\"width: 150px; height: 150px;\"></a>";
												temp += "<b style=\"color: white; font-size: 15px;\">"
														+ dom.productname
														+ "</b><br>";
												temp += "<b style=\"color: white; font-size: 18px;\">"
														+ dom.priceView
														+ "</b></div>";
											}
										});
						$("span#slist").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}

</script>
</head>
<body onload="ajaxList('/web/mainList.do','json')">
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="margin-top: 7%; margin-bottom: 5%; float: left; width: 100%; height: 100%; background-color: white;">
		<div
			style="float: left; margin-left: 5%; margin-top: 2%; cursor: pointer;">
			<a href="/web/mainEvent.do?category=category12"><img alt="" src="bmImage/mainevent.jpg"></a>
		</div>
		<div
			style="float: left; margin-left: 1%; margin-top: 2%; background-color: rgb(70, 205, 223); width: 400px; height: 300px; text-align: center;">
			<div
				style="margin-left: 35%; margin-top: 5%; border: 1px solid white; width: 100px; height: 27px; text-align: center;">
				<b style="color: white; font-size: 15px; line-height: 27px">추천상품</b>
			</div>
			<span id="slist"></span>
		</div>
		<div
			style="margin-left: 5%; margin-top: 27%; width: 1136px; height: 100px; text-align: center; border-top: 1px solid #484848; border-bottom: 1px solid #484848;">
			<b style="color: #484848; font-size: 27px; line-height: 100px">관련상품</b>
		</div>
		<div id="pdiv"
			style="float: left; width: 90%; margin-left: 0%; margin-top: 2%"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>