<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="bmcss.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
$(function() {
	$("img#search").click(function() {
		var select = $("select[name=selectsearch] option:selected").val();
		if(select=='empty'){
			alert('검색할 카테고리를 선택하세요');
		}else{
			
		}
	});
});
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
										temp += "<a href=\"/web/detail.do?productcode="
												+ dom.productcode
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
				},
				error : function(e) {
					alert('error' + e);
				}
			});
}
</script>
</head>
<body onload="ajaxList('/web/selectJalList.do','json')">
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="margin-top: 6.6%; float: left; width: 100%; height: 100%; background-color: white;">
		<div style="margin-top: 3%;margin-bottom: 3%;margin-left:20%; width: 100%">
		<select name="selectsearch" style="height: 40px;width: 10%;">
		<option value="empty">선택하세요</option>
		<option value="category">카테고리</option>
		<option value="productname">제품명</option>
		<option value="productcode">제품코드</option>
		<option value="productprice">제품가격</option>
		</select>
		<input type="text" style="width: 40%; line-height: 40px; font-size: 20px; margin-left: 1%">
		<img id="search" alt="검색" src="bmImage/검색.png" style="margin-left: 1%">
		</div>
	
		<div
			style="margin-left: 5%; margin-top: 1%; width: 1136px; height: 50px; text-align: center; border-top: 1px solid #484848; border-bottom: 1px solid #484848;">
			<b style="color: #484848; font-size: 20px; line-height: 50px">검색 결과</b>
		</div>
	</div>
	<div id="pdiv"
		style="float: left; width: 90%; margin-left: 2%; margin-bottom: 10%";>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>