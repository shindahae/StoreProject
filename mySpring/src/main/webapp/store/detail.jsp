<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<link rel="stylesheet" type="text/css" href="bmcss.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cartamount").val("1");
		$("#selectamount").change(function() {
			if ($(this).val() == '6') {
				$("#cartamount").val('');
				$("#cartamount").attr("disabled", false);
			} else {
				$("#cartamount").val($(this).val());
				$("#cartamount").attr("disabled", true);
			}
		});

		$("#cartButton").click(function() {
			var productcode = $("input[name=productcode]").val();
			cartcheck(productcode);
		});

		$("#orderButton").click(function() {
			var productcode = $("input[name=productcode]").val();
			$("#cartamount").attr("disabled", false);
			var cartamount = $("input[name=cartamount]").val();
			$("#ownerno").attr("disabled", false);
			var ownerno = $("input[name=ownerno]").val();
			directorder(productcode, cartamount, ownerno);
		});

	});

	// ��ٱ��� �ߺ� üũ �� ���
	function cartcheck(productcode) {
		$.ajax({
			url : '/web/cartcheck.do',
			async : false,
			data : 'productcode=' + productcode,
			type : 'post',
			success : function(v) {
				if (v == "e") {
					alert('��ٱ��Ͽ� �̹� �����ϴ� ��ǰ�Դϴ�');
				} else {
					$("#cartamount").attr("disabled", false);
					frm.submit();
				}
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});
	}

	// �ٷ� �ֹ��ϱ�
	function directorder(productcode, cartamount, ownerno) {
		$.ajax({
			url : '/web/directorder.do',
			async : false,
			data : 'productcode=' + productcode + "&cartamount=" + cartamount
					+ "&ownerno=" + ownerno,
			type : 'post',
			success : function() {
				alert('�ֹ��� �Ϸ�Ǿ����ϴ�');
				location.href='/web/mypage.do';
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<form name="frm" action="/web/cartAdd.do" method="post">
		<div
			style="margin-top: 5%; float: left; width: 100%; margin-bottom: 100px">
			<div
				style="float: left; margin-top: 4%; margin-left: 17.5%; width: 65%; background-color: white;">
				<div style="float: left;">
					<img alt="" src="bmImage/${info.productimage}.jpg" width="400px"
						height="400px">
				</div>
				<div
					style="float: right; background-color: white; width: 45%; margin-top: 5%">
					<div
						style="float: left; margin-bottom: 5%; width: 100%; background-color: white;">
						<b style="font-size: 30px;">${info.productname}</b>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">��ǰ �ڵ�</b><b style="float: right;">${info.productcode}</b>
						<input type="hidden" name="productcode"
							value="${info.productcode}"> <input type="hidden"
							name="ownerno" value="TESTOWNER01">
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">���� �ܰ�</b><b style="float: right;">${info.productunit}</b>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">������</b><b style="float: right;">${info.productproduction}</b>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">��ۻ�</b><b style="float: right;">${info.productdelivery}</b>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">�ǸŰ���</b><b style="float: right;">${info.productprice}</b>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<b style="font-size: 13px;">����</b> <select id="selectamount"
							style="margin-left: 70%;">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">�����Է�</option>
						</select>
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<input id="cartamount" name="cartamount" type="text"
							style="margin-left: 78.5%; width: 20%" disabled="true">
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white; margin-top: 15px">
						<input id="orderButton" type="button" value="�ֹ��ϱ�"
							style="border: 1px solid rgb(70, 205, 223); width: 100%; background-color: rgb(70, 205, 223); color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
					</div>
					<div
						style="float: left; margin-bottom: 2.5%; width: 100%; background-color: white;">
						<input id="cartButton" type="button" value="��ٱ���"
							style="border: 1px solid rgb(70, 205, 223); width: 100%; background-color: rgb(70, 205, 223); color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>