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
</head>
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
											temp += "<div style=\"float: left; width: 200px; height:400px; margin-left: 6%;margin-top: 1%;\">";
											temp += "<a href=\"/web/detail.do?productcode="
													+ dom.productcode
													+ "\"><img alt=\"\" src=\"bmImage/"+dom.productimage+".jpg\" width=\"260px\" height=\"300px\"></a>";
											temp += "<div style=\"width: 100%; margin-top: 2%;\">";
											temp += "<b>" + dom.productname
													+ "</b></div>"
											temp += "<div style=\"width: 100%; margin-top: 2%; margin-bottom: 18%;\">";
											temp += "<img alt=\"\" src=\"bmImage/best.gif\">";
											temp += "<font style=\"float: right; font-size:0.8em;\">"
													+ dom.productunit
													+ "</font><br>";
											temp += "<b style=\"float: right; border-bottom: 3px solid black;\">"
													+ dom.priceView + "</b>";
											temp += "</div></div></div>";
											$("strong").text(
													"- " + dom.category + " -");
										});
						$("div#pdiv").html(temp);

					},
					error : function(e) {
						alert('error' + e);
					}
				});
		$(function() {
			$("img").click(
					function() {                     
						ajaxList('/web/productSelectList.do?category='
								+ $(this).attr("id"), 'json');
					});
		});
	}
</script>
<body
	onload="ajaxList('/web/productSelectList.do?category=category1','json')">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="categoryimg"
		style="margin-top: 8%; float: left; margin-bottom: 1.5%; border-bottom: 1px solid gray; width: 100%; height: 125px;">
		<img id="category1" alt="" src="bmImage/cate0.png"
			style="border-radius: 50%; width: 80px; margin-left: 5%; margin-bottom: 1%;">
		<img id="category2" alt="" src="bmImage/cate1.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category3" alt="" src="bmImage/cate2.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category4" alt="" src="bmImage/cate3.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category5" alt="" src="bmImage/cate4.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category6" alt="" src="bmImage/cate5.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category7" alt="" src="bmImage/cate6.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category8" alt="" src="bmImage/cate7.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category9" alt="" src="bmImage/cate8.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category10" alt="" src="bmImage/cate9.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category11" alt="" src="bmImage/cate10.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<img id="category12" alt="" src="bmImage/cate11.png"
			style="border-radius: 50%; width: 80px; margin-left: 1%; margin-bottom: 1%;">
		<b style="margin-left: 5.5%;">전체상품</b> <b style="margin-left: 3%;">포장랩,백</b>
		<b style="margin-left: 3%;">종이봉투</b> <b style="margin-left: 3%;">비닐봉투</b>
		<b style="margin-left: 4%;">수저</b> <b style="margin-left: 4%;">위생용품</b>
		<b style="margin-left: 3%;">냉장냉동</b> <b style="margin-left: 3%;">가공식품</b>
		<b style="margin-left: 4%;">음료</b> <b style="margin-left: 5.5%;">쌀</b>
		<b style="margin-left: 4.5%;">농수산물</b> <b style="margin-left: 5%;">닭</b>
	</div>

	<div style="float: left; margin-bottom: 100px;">
		<div style="width: 100%; float: left; border-bottom: 1px solid gray;">
			<strong
				style="margin-left: 47%; margin-top: 1%; margin-bottom: 2%; float: left; font-size: 20px;">-
				전체 -</strong>
		</div>
		<div>
			<hr style="color: gray;">
		</div>
		<div id="pdiv" style="float: left; width: 90%; margin-left: 3%;"></div>
	</div>


	<!-- <div class="btn-toolbar demoPadder" role="toolbar"
		aria-label="Toolbar with button groups"
		style="margin-left: 42%; margin-bottom: 5%">
		<div class="btn-group" role="group" aria-label="First group">
		<button type="button" class="btn btn-default">◁</button>
			<button type="button" class="btn btn-default">◀</button>
			<button type="button" class="btn btn-default">1</button>
			<button type="button" class="btn btn-default">2</button>
			<button type="button" class="btn btn-default">3</button>
			<button type="button" class="btn btn-default">4</button>
			<button type="button" class="btn btn-default">5</button>
			<button type="button" class="btn btn-default">6</button>
			<button type="button" class="btn btn-default">7</button>
			<button type="button" class="btn btn-default">▶</button>
			<button type="button" class="btn btn-default">▷</button>
		</div>
	</div> -->


	<div class="paging">${page}</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>