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
<script>
	function ajaxEvent(url, dataType) {
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
											temp += "<div style=\"float: left; width: 300px; margin-left: 3%; margin-top: 1%\">";
											temp += "<img alt=\"\" src=\"bmImage/"+dom.productimage+".jpg\" style=\"width: 300px;\">";
											temp += "<b style=\"color: #484848; font-size: 25px; line-height: 40px; margin-left: 2%\">[세일기간]"
													+ dom.startdate
													+ " ~ "
													+ dom.enddate + "</b><br>";
											temp += "<b style=\"color: #484848; font-size: 20px; line-height: 70px; margin-left: 2%\">"
													+ dom.productname + "</b>";
											temp += "<img alt=\"\" src=\"bmImage/sale.gif\" style=\"margin-left: 10px;\"><br>";
											temp += "<b style=\"color: gray; font-size: 15px; line-height: 20px; margin-left: 2%\">"
													+ dom.productunit
													+ "</b><br> ";
											temp += "<b style=\"color: gray; font-size: 15px; line-height: 20px; text-decoration: line-through; margin-left: 2%\">"
													+ dom.productprice
													+ "</b><br> ";
											temp += "<b style=\"color: rgb(70, 205, 223); font-size: 25px; margin-left: 2%; line-height: 50px\">"
													+ dom.priceView	+ "</b></div>";
										});
						$("div#pdiv").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}
</script>
</head>
<body onload="ajaxEvent('/web/eventList.do','json')">
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="margin-top: 5%; float: left; width: 100%; height: 100%; background-color: white;">
		<img alt="" src="bmImage/timesale.jpg" style="margin-left: 5%" width="1136px">
		<div
			style="margin-left: 5%; margin-top: 1%; width: 1136px; height: 100px; text-align: center; border-top: 1px solid #484848; border-bottom: 1px solid #484848;">
			<b style="color: #484848; font-size: 27px; line-height: 100px">깜짝세일</b>
		</div>
	</div>
	<div id="pdiv" style="float: left; width: 80%; margin-left: 10%; margin-bottom: 10%">

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>