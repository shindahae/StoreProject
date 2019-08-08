<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=button]{
transition-property:all;/*�Ӽ���*/
transition-duration:0.3s;/*ȿ���� �Ϸ��ϴµ� �ɸ��� �ð�*/
transition-timing-function:ease-in-out;/*ȿ���� �ӵ��*/
transition-delay:0;/*ȿ���� �����Ǵ� �ð�*/
}
input[type=button]:hover{
cursor: pointer;
box-shadow: 6px 6px #777;
transition-property:all;/*�Ӽ���*/
transition-duration:0.3s;/*ȿ���� �Ϸ��ϴµ� �ɸ��� �ð�*/
transition-timing-function:ease-in-out;/*ȿ���� �ӵ��*/
transition-delay:0;/*ȿ���� �����Ǵ� �ð�*/
}

</style>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
var owner="00001";
var no =1;

   function ajax(){
	   var temp="";
	   $.ajax({
			  url:"/web/myPageList.do",
			  cache:false,
			  data:"ownerno="+owner+"&page="+$("#pageText").val(),
			  type:"POST",
			  dataType:"json",
			  success:function(v){
				  $("#mileage").html(v.supportprice);//�Ŀ������� ����� �����ֱ�			  
				  var productOrderTotalPrice=0;//�� �ݾ�
				  var list=$(v["list"]);
				  $(list).each(function(index,dom){
					 productOrderTotalPrice+=(dom.productprice);
					  console.log(v);
  				      temp+="<div id=\"order\" style=\"width:100%; color:black; float: left; background-color: white; font-size: 13px; padding-bottom:1.5% ; padding-top:1.5%; display: flex; border-bottom: 2px #F6F6F6 solid;\">";
					  if(($(list).length)>index){
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%;  text-align: center; font-size: 14px; color:#666666;\">"+dom.no+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:19.9%;  text-align: center; font-size: 12px; color:#99B0B0;\"><img src=\"/web/store/processedFood/"+dom.productcode+".jpg\"style=\"width:70px;\"><br>"+dom.productname+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; font-size: 14px; color:#666666;\">"+dom.productquantity+"��</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:10%; text-align: center; font-size: 14px; color:#666666;\">"+dom.orderdate+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; font-size: 14px; color:#666666;\">"+dom.productprice+"��</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:10.5%; text-align: center;\">-</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; \">-</b>";
		              if(dom.delevery=="�Ϸ�"){
		            	  if(dom.latterChk==1){
		                    temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"</b>";
		            	  }else if(dom.latterChk==0){
		            		temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"<br><br><input type=\"button\" value=\"�ı��ۼ�\" onclick=latterWrite("+dom.no+")></b>";  
		            	  }
		              }else if(dom.delevery=="�����"){
		              temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"<br><br><input type=\"button\" value=\"�����ȸ\" onclick=deleveryChk()></b>";  
		              }
		              temp+="</div>";
		               $("#mileage").html(dom.mileage);
					  }
		              else if(($(v).length)-index==3){
					   $("#extendedprice").html(dom);  
					  }else if(($(v).length)-index==2){
					   $("#cart").html(dom);  
					  }
				       
				 });
				$("#container").html(temp);
				$("div#page").html($(v["page"]));
				$("#extendedprice").html(productOrderTotalPrice);//�� ���ž� �����ֱ�.
				if(productOrderTotalPrice<500000){
					$("#grade").html("�ʺ�����(2%)");  //�����,��ڻ���,�Ϲݻ���,�ʺ�����
				}else if(productOrderTotalPrice>=500000&&productOrderTotalPrice<1000000){
					$("#grade").html("�Ϲݻ���(3%)"); 
				}else if(productOrderTotalPrice>=1000000&&productOrderTotalPrice<1500000){
					$("#grade").html("��ڻ���(4%)"); 
				}else if(productOrderTotalPrice>=1500000){
					$("#grade").html("�����(5%)"); 
				}
				$("a.pageP").click(function(){
					
					$("input#pageText").val($(this).attr("lang"));
					ajax();
				});
			  },
			  error:function(request,status){
				  alert("error code="+request.status);
			  }
		   });
   }

   function latterWrite(no){
	   window.open("/web/latterWrite.do?no="+no,"�����ȸ","width=600,height=580,top=100,left=200 resizable=no");
   }
   
   function deleveryChk(){
	   window.open("http://www.cjgls.co.kr/kor/service/service02_02.asp?slipno=","","width=540,height=450,top=100,left=200");
   }

    $(function(){
        $('#categoryButton,#cateShow').mouseenter(function(){
          $('#cateShow').css("display","block");
        });
        $('#categoryButton,#cateShow').mouseleave(function(){
          $('#cateShow').css("display","none");
        });
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////�Ŀ��ϱ� ��ư
        
        $("#a").hide();//�Ŀ� 1 �̹���
        $("#b").hide();//�Ŀ� 2 �̹���
        $("#c").hide();//�Ŀ� 3 �̹���
        $("#d").hide();//�Ŀ� 4 �̹���
        $("#e").hide();//�Ŀ� 5 �̹���
        $("#f").hide();//�Ŀ� 6 �̹���
        
        $("#supportbt").click(function(){
        	$("#a").show(1000);
            $("#b").show(1500);
            $("#c").show(2000);
            $("#d").show(2500);
            $("#e").show(2700);
            $("#f").show(2900);
        });
        
        $("#a,#b,#c,#d,#e,#f").mouseenter(function(){
        	
        	$("#"+this.id+"").css("z-index",1);//this.id�� ���ָ� ���콺�� �� ���� id�� ���� �� �ִ�.
        	$("#"+this.id+"").click(function(){//�Ŀ��ϰ� ���� ���̸� Ŭ�� ������ �߻��Ѵ�.
        		
        		 window.location.href="/web/laboratoryMove.do?change="+this.id+"&ownerno="+1;
        	});
        });
        $("#a,#b,#c,#d,#e,#f").mouseleave(function(){
        	$("#"+this.id+"").css("z-index",0);
        		
        });
        
        
      }); 
</script>
<style type="text/css">
   .category:hover{
      border-bottom:3px solid black;
   }
   .basket:hover{
      border-bottom:2px solid gray;
   }
   th{
      font-size:13px;
      color: gray;
      cursor: pointer;
      background-color: pink;
   } 
input[type=button]{
width: 50px;
height: 20px;
border-radius:6px;
border: 0;
font-size: 10px;
}

</style>
</head>
<body onload="ajax()">

  <jsp:include page="header.jsp"></jsp:include>

	<div style="width: 11%; height: 600px; background-color:; border:;  float: left; margin-top: 10%; margin-left: 16%; font-size: 12px;">
		<div style="background-color:; width: 100%; padding-top: 5%; border-bottom: 1px solid gray; float: left;">
			<b style="background-color:; float: left; font-size: 17px;">����������</b><br><br>
		</div>
	<div style="background-color:; width: 100%; padding-top: 5%; border-bottom: 1px solid gray; float: left;">
			<b style="background-color:; float: left; font-size: 13px; font-weight: bold; margin-top:10px; margin-bottom: 10px;">������ <b style="font-size: 12px; color: gray;">��</b></b><br>
			
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1; ">ȸ���׷�</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:bold; color:blue; flex-grow:3;" id="grade"></b><br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1; ">�ѱ��ž�</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;" id="extendedprice"></b>��<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1;">�Ŀ�������</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;"id="mileage">0</b>��<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex ; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1;" >��ٱ���</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;"id="cart"></b>��<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px; margin-bottom: 15px;">
	     <input id="supportbt" type="button" value="�Ŀ��ϱ�" style="margin:0 auto ; width:70px ;height:30px ; background-color: white; font-weight: bold; border: 1px solid gray; font-size: 11px; color: red; border-radius: 10px 10px 10px 10px;">		
	  </div>
		</div>
		
		<div style="background-color:; width: 100%; padding-top: 20%; border-bottom: 1px solid gray; float: left;">
		   <b style="background-color:; text-align:left;  font-size: 14px; font-weight:900;">����������</b><br><br>
		   <a href="#" style="text-decoration: none; margin-top: 10px;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray;">�ֹ��������������</b></a><br><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">1:1���ǰԽ���</b></a><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">���ǻ�ǰ�ı�</b></a><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">���ǻ�ǰ����</b></a><br><br><br>
		</div>
	</div>
	
		
	<div style="width: 58%; height: 500px; background-color:; float: left; margin-top: 10%; margin-left: 7%;">
		 <div style="float: left; background-color: white; width: 70%; margin-left:; margin-top:; margin-bottom: 1%;">
            <b style="font-size: 25px;">�ֹ����� �� �����ȸ</b>
         </div>
         <div style="float: left; width: 100%; margin-left:; background-color: white; border-top: 1px solid gray; border-bottom:; display: block;">
           <div style="width:100%; color:#99B0B0; float: left; background-color: #F6F6F6; font-size: 13px; padding-bottom:1.5% ; padding-top:1.5% ; display: flex;">
             <b style="float: left; background-color:;  flex-basis:11%;  text-align: center;">�ֹ���ȣ</b>
             <b style="float: left; background-color:;  flex-basis:19.9%;  text-align: center;">�ֹ���ǰ</b>
             <b style="float: left; background-color:;   flex-basis:11%; text-align: center;">�ֹ�����</b>
             <b style="float: left; background-color:;  flex-basis:10%; text-align: center;">�ֹ��Ͻ�</b>
             <b style="float: left; background-color:;   flex-basis:11%; text-align: center;">�ֹ��ݾ�</b>
             <b style="float: left; background-color:;  flex-basis:10.5%; text-align: center;">��ұݾ�</b>
             <b style="float: left; background-color:; flex-basis:11%; text-align: center;">�ֹ�����</b>
             <b style="float: left; background-color:; flex-grow:1; text-align: center;">�������</b>
          </div>
          <span id="container">
          </span>
          <div id="page" style="text-align: center; font-size: 13px; margin-top: 20px;  padding-top: 450px;">
         </div>
	  </div>
	  
     </div>
     
     <!--hidden ��ҵ�  -->
     <input type="hidden" id="pageText" name="page" value="1">
     <img id="a" alt="" src="/web/store/support/��������.jpg" width="200px" height="200px" style="position: absolute; position: fixed; top:20% ; left: 20%; z-index: 0; cursor: pointer; ">
     <img id="b" alt="" src="/web/store/support/�¾籤����2.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:30% ;left: 28%; z-index: 0; cursor: pointer;">
     <img id="c" alt="" src="/web/store/support/����������.png" width="200px" height="200px"style="position: absolute; position: fixed; top:40% ;left: 36%; z-index: 0; cursor: pointer;">
     <img id="d" alt="" src="/web/store/support/�Ҿױ��.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:50% ;left: 44%; z-index: 0; cursor: pointer;">
     <img id="e" alt="" src="/web/store/support/�ֺ����Ŀ�.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:40% ;left: 52%; z-index: 0; cursor: pointer;">
     <img id="f" alt="" src="/web/store/support/���������Ŀ�.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:30% ;left: 60%; z-index: 0; cursor: pointer;">
</body>
</html>