<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
</style>
</head>
<body onload="orderlistToBasket()">
	<input id="basketNo" type="hidden" value="${tempId}">
	<!-- 장바구니 페이지 에서 선택한 상품들의 no를 합쳐서 가져와서 여기에 담아둔다.-->
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 10%; margin-bottom: 1%;">
		<b style="font-size: 20px;">주문하기</b>
	</div>
	<div
		style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0;">
		<div
			style="width: 100%; color: #99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom: 1.5%; padding-top: 1.5%;">
			<b style="float: left; margin-left: 2%;">상품정보</b> <b
				style="float: left; margin-left: 55%;">판매가</b> <b
				style="float: left; margin-left: 10%;">수량</b> <b
				style="float: left; margin-left: 14%;">합계</b>
		</div>

		<form id="frm" method="post" action="/web/pageback.do">
			<input type="hidden" name="productcode" value="${bmbean.productcode}">
			<input type="hidden" name="ownerno" value="${bmbean.ownerno}">
			<div
				style="float: left; background-color: white; width: 100%; padding-bottom: 3%;">
				<!--주문목록 비율 맞추기 위해 맨위 공간을 3%로 잡아둠  -->
			</div>

			<div id="list">
				<div
					style="float: left; background-color: white; width: 100%; padding-bottom: 3%;">
					<div style="float: left; background-color: white; width: 100%;">
						<div style="width: 62%; height: 100px; float: left;">
							<img alt="상품이미지"
								src="/web/store/processedFood/${bmbean.productimage}"
								width="100px" height="100px" style="float: left;"> <b
								style="background-color: white; float: left; margin-top: 3%; margin-left: 5%; width: 70%; height: 35%;">${bmbean.productname}</b>
							<input type="hidden" name="productname"
								value="${bmbean.productname}">
						</div>
						<div
							style="background-color: white; width: 15.5%; height: 100px; float: left;">
							<b style="margin-top: 12%; float: left;">${bmbean.productprice}원</b>
							<input type="hidden" name="productprice"
								value="${bmbean.productprice}">
						</div>
						<div
							style="background-color: white; width: 10%; height: 100px; float: left;">
							<b style="margin-top: 20%; float: left;">${bmbean.productquantity}개</b>
							<input type="hidden" name="productquantity"
								value="${bmbean.productquantity}">
						</div>
						<div
							style="background-color: white; width: 11.9%; height: 100px; float: left;">
							<b style="float: right; margin-top: 17%;">${bmbean.productprice*bmbean.productquantity}원</b>
						</div>
					</div>
				</div>
			</div>

		</form>

		<div
			style="float: left; width: 100%; text-align: right; padding-bottom: 3%; padding-top: 3%; margin-right: 3%; border-top: 1px solid gray;">
			<b>상품합계금액 (배송비 별도)</b><br> <b id="totalPrice"
				style="font-size: x-large; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity}원</b>
		</div>
	</div>
	<div
		style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 3%; margin-bottom: 1%;">
		<b style="font-size: 20px;">주문서 작성</b>
	</div>
	<div
		style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
		<div>
			<b style="font-size: 15px;">주문자 정보</b>
		</div>
		<div
			style="float: left; background-color: white; width: 100%; padding-top: 2%">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td style="font-size: 13px; color: gray; width: 25%;"><b>주문하시는
								분 :</b></td>
						<td><input type="text" style="height: 30px;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주소
								:</b></td>
						<td><input type="text"
							style="width: 70px; height: 30px; margin-top: 2%;"> ( <input
							type="text" style="width: 60px; height: 30px; margin-top: 2%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"> ) <input
							type="button"
							style="font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
							value="우편번호 검색"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주문자
								핸드폰 :</b></td>
						<td><input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"> - <input
							type="text" style="width: 60px; height: 30px; margin-top: 2%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주문자
								전화 :</b></td>
						<td><input type="text"
							style="width: 60px; height: 30px; margin-top: 1.5%;"> - <input
							type="text" style="width: 60px; height: 30px; margin-top: 1.5%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 1.5%;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>이메일
								:</b></td>
						<td><input type="text"
							style="height: 30px; margin-top: 2%; width: 20%;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div
		style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
		<div>
			<b style="font-size: 15px;">배송 정보</b>
		</div>
		<div
			style="float: left; background-color: white; width: 100%; padding-top: 2%">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td style="font-size: 13px; color: gray; width: 15%;"><b>배송지
								확인 :</b></td>
						<td><input type="checkbox"><font
							style="font-size: 13px;">주문고객 정보와 동일합니다</font></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; width: 20%; padding-top: 2%;"><b>받으실분
								:</b></td>
						<td><input type="text" style="height: 30px; margin-top: 2%;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>받으실
								곳 :</b></td>
						<td><input type="text"
							style="width: 70px; height: 30px; margin-top: 2%;"> ( <input
							type="text" style="width: 60px; height: 30px; margin-top: 2%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"> ) <input
							type="button"
							style="font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
							value="우편번호 검색"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>핸드폰
								번호 :</b></td>
						<td><input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"> - <input
							type="text" style="width: 60px; height: 30px; margin-top: 2%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; width: 15%; padding-top: 2.5%;"><b>전화번호
								:</b></td>
						<td><input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"> - <input
							type="text" style="width: 60px; height: 30px; margin-top: 2%;">
							- <input type="text"
							style="width: 60px; height: 30px; margin-top: 2%;"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; width: 25%; padding-top: 2%;"><b>남기실
								말씀 :</b></td>
						<td><input type="text"
							style="height: 30px; margin-top: 2%; width: 50%"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div
		style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
		<div>
			<b style="font-size: 15px;">결제금액</b>
		</div>
		<div
			style="float: left; background-color: white; width: 100%; padding-top: 2%">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td style="font-size: 13px; color: gray; width: 25%;"><b>상품합계금액
								:</b></td>
						<td><font id="totalPrice" style="font-size: 13px;">${bmbean.productprice*bmbean.productquantity}원</font></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>배송비
								:</b></td>
						<td style="padding-top: 2%"><font style="font-size: 13px;">+2,500원</font></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>쿠폰
								적용 :</b></td>
						<td><font style="font-size: 13px;">할인 </font><input
							id="couponApplication" type="text"
							style="text-align: right; width: 100px; height: 30px; margin-top: 2%;"
							placeholder="0"><font style="font-size: 13px;">원 </font><input
							id="couponBt" type="button"
							style="cursor: pointer; font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
							value="쿠폰조회 및 적용"></td>
					</tr>
					<tr>
						<td
							style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>총
								결제금액 :</b></td>
						<td style="padding-top: 2%"><font id="totalPrice2"
							style="font-size: 30px; font-weight: bold; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity+2500}원</font></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div
		style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
		<div>
			<b style="font-size: 15px;">결제수단</b>
		</div>
		<div
			style="float: left; background-color: white; width: 100%; padding-top: 2%">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td style="font-size: 13px; color: gray; width: 25%;"><b>일반결제
								:</b></td>
						<td><input type="radio"><font
							style="font-size: 13px;">신용카드</font><input type="radio"><font
							style="font-size: 13px;">핸드폰</font></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div
		style="float: left; width: 70%; margin-left: 15%; margin-top: 2.5%; margin-bottom: 2.5%; background-color: white;">
		<input id="pageback" type="button" value="이전으로"
			style="cursor: pointer; float: left; margin-left: 33%; border: 1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
		<input id="orderButton" type="button" value="결제하기"
			style="cursor: pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
	</div>

</body>
</html>