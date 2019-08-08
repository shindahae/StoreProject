<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	//��ٱ��� ��� �������� 
	function cartList() {
		$
				.ajax({
					url : '/web/cartList.do',
					type : 'post',
					dataType : 'json',
					success : function(v) {
						var temp = '';
						var proprice = 0;
						var tprice = 0;
						$(v)
								.each(
										function(index, dom) {
											proprice = (dom.productprice)
													* (dom.cartamount);
											tprice += proprice;

											temp += "<div style=\"float: left; background-color: white; width: 100%; margin-bottom: 3%; margin-top:3%;\">";
											temp += "<div style=\"width:6%; height:100px; float:left;\">";
											temp += "<input id=\""
													+ dom.productcode
													+ "\" type=\"checkbox\" name=\"ckb\" style=\"margin-top: 60%\">";
											temp += "</div>";
											temp += "<div style=\" width:60%; height: 100px; float: left;\">";
											temp += "<img alt=\"��ǰ�̹���\" src=\"bmImage/"+dom.productimage+".jpg"+"\" width=\"100px\" height=\"100px\"  style=\"float: left;\">";
											temp += "<b style=\"float: left; margin-left: 5%; width: 70%; height: 35%;\">"
													+ dom.productname + "</b>";
											temp += "<a href=\"/web/detail.do?no="
													+ dom.no
													+ "\"><input type=\"button\" value=\"��ǰ������\" style=\" color:gray; font-weight: bold; background-color:white; float: left; margin-left: 5%; width:100px; height:30px;\"></a>";
											temp += "</div>";
											temp += "<div style=\" width:8%; height: 100px; float: left;\">";
											temp += "<b>" + dom.productprice
													+ "��</b>";
											temp += "</div>";
											temp += "<div style=\" width:8%; height: 100px; float: left; margin-left:4%;\">";
											temp += "<input type=\"text\" name=\""
													+ dom.no
													+ "\" style=\"float:left; width:45%; height:35px; font-weight: bold; padding-left: 35px;\" value=\""
													+ dom.cartamount + "\">";
											temp += "<input onclick=\"cartmodify("
													+ dom.no
													+ ")\" type=\"button\" value=\"����\" style=\"color:gray; font-weight: bold; background-color: white; width: 100%; height: 35px; margin-top: 15%;\">";
											temp += "</div>";
											temp += "<div style=\" width:11.9%; height: 100px; float: left;\">";
											temp += "<b style=\"float:right;\">"
													+ proprice + "��</b>";
											temp += "</div>";
											temp += "</div>";
										});

						$("#cartlist").html(temp);
						$("#totalprice").html(tprice + '��');
					},
					error : function(request, status) {
						alert("error code = " + request.status);
					}
				});
	};
	//��ٱ��� ���� ����
	function cartmodify(no) {
		var cartamount = $("input[name=" + no + "]").val();
		$.ajax({
			url : '/web/cartmodify.do',
			data : 'no=' + no + '&cartamount=' + cartamount,
			type : 'post',
			success : function() {
				alert('������ ����Ǿ����ϴ�');
				basket();
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});

	}
	// ��ٱ��� ��� ����
	function alldelete(ownerno) {
		$.ajax({
			url : '/web/alldelete.do',
			data : 'ownerno=' + ownerno,
			type : 'post',
			success : function() {
				alert('��ٱ��Ͽ� �����ϴ� ��ǰ�� �����ϴ�');
				location.href = 'category.jsp';
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});
	}
	// ��ٱ��� ���� ����
	function checkdelete(productcode) {
		$.ajax({
			url : '/web/checkdelete.do',
			data : 'productcode=' + productcode,
			type : 'post',
			success : function() {
				cartList();
			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});
	}
	// ��ٱ��� ���� �ֹ�
	function checkorder(productcode) {
		$.ajax({
			url : '/web/checkorder.do',
			data : 'productcode=' + productcode,
			type : 'post',
			success : function() {

			},
			error : function(request, status) {
				alert("code=" + request.status);
			}
		});
	}

	$(function() {
		/*
		 $("input[type=button]#orderbt").click(function(){//���� �ֹ��ϱ�
		  var tempId='';
		  $("input[type=checkbox]:checked").each(function(index,dom){
			  tempId+=dom.id+'-';//üũ�ڽ� ������ �ֵ� id�� ��� no�� ������,#���� �ٿ��� ���� ù��° ���� ����....#���� �ٿ��� ����ȵȴ�...
		  });
		  
		  window.location.href="/web/orderPageMove.do?tempId="+tempId+"&page=2";
		 }); */

		//�����ֹ�
		$("input[type=button]#checkorder").click(function() {
			$("input[type=checkbox]:checked").each(function(index, dom) {

			})
		})
		//���û���
		$("input[type=button]#checkdelete").click(function() {
			$("input[type=checkbox]:checked").each(function(index, dom) {
				checkdelete(dom.id);
			})
		})

	});
</script>
</head>
<body onload="cartList()">
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 10%; margin-bottom: 1%;">
		<b style="font-size: 25px;">��ٱ���</b>
	</div>

	<div
		style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0;">
		<div
			style="width: 100%; color: #99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom: 1.5%; padding-top: 1.5%;">
			<b style="float: left; margin-left: 2%;">����</b> <b
				style="float: left; margin-left: 4%;">��ǰ����</b> <b
				style="float: left; margin-left: 51.5%;">�ǸŰ�</b> <b
				style="float: left; margin-left: 8%;">����</b> <b
				style="float: left; margin-left: 9%;">�հ�</b>
		</div>

		<div id="cartlist">
			<!-- ��ٱ��� ��ǰ ����Ʈ -->
		</div>

	</div>

	<div
		style="float: left; width: 70%; margin-left: 15%; margin-top: 2.5%; margin-bottom: 2.5%; background-color: white; border-bottom: 1px solid #99B0B0;">

		<b id="totalprice"
			style="color: gray; font-size: 25px; margin-right: 1%; float: right; margin-top: -10px;"></b>
		<b
			style="float: right; margin-right: 3%; font-size: 13px; padding-bottom: 3%;">��ǰ�հ�ݾ�(��ۺ�
			����)</b>

	</div>

	<div
		style="float: left; width: 70%; margin-left: 15%; margin-top: 2.5%; margin-bottom: 2.5%; background-color: white;">
		<input id="checkdelete" type="button" value="���û���"
			style="cursor: pointer; float: left; margin-left: 17%; border: 1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
		<input id="alldelete" type="button" value="����"
			onclick="alldelete('TESTOWNER01')"
			style="cursor: pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
		<a href="category.jsp"><input id="backbt" type="button"
			value="���� ����ϱ�"
			style="cursor: pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;"></a>
		<input id="checkorder" type="button" value="���� �ֹ��ϱ�"
			style="cursor: pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
	</div>


</body>
</html>