<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=button]{
transition-property:all;/*속성값*/
transition-duration:0.3s;/*효과를 완료하는데 걸리는 시간*/
transition-timing-function:ease-in-out;/*효과의 속도곡선*/
transition-delay:0;/*효과의 지연되는 시간*/
}
input[type=button]:hover{
cursor: pointer;
box-shadow: 6px 6px #777;
transition-property:all;/*속성값*/
transition-duration:0.3s;/*효과를 완료하는데 걸리는 시간*/
transition-timing-function:ease-in-out;/*효과의 속도곡선*/
transition-delay:0;/*효과의 지연되는 시간*/
}

</style>
<meta charset="EUC-KR">
<title>리추로 상회</title>
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
				  $("#mileage").html(v.supportprice);//후원적립금 뷰딴에 보여주기			  
				  var productOrderTotalPrice=0;//총 금액
				  var list=$(v["list"]);
				  $(list).each(function(index,dom){
					 productOrderTotalPrice+=(dom.productprice);
					  console.log(v);
  				      temp+="<div id=\"order\" style=\"width:100%; color:black; float: left; background-color: white; font-size: 13px; padding-bottom:1.5% ; padding-top:1.5%; display: flex; border-bottom: 2px #F6F6F6 solid;\">";
					  if(($(list).length)>index){
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%;  text-align: center; font-size: 14px; color:#666666;\">"+dom.no+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:19.9%;  text-align: center; font-size: 12px; color:#99B0B0;\"><img src=\"/web/store/processedFood/"+dom.productcode+".jpg\"style=\"width:70px;\"><br>"+dom.productname+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; font-size: 14px; color:#666666;\">"+dom.productquantity+"개</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:10%; text-align: center; font-size: 14px; color:#666666;\">"+dom.orderdate+"</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; font-size: 14px; color:#666666;\">"+dom.productprice+"원</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:10.5%; text-align: center;\">-</b>";
		              temp+="<b style=\"float: left; background-color:; flex-basis:11%; text-align: center; \">-</b>";
		              if(dom.delevery=="완료"){
		            	  if(dom.latterChk==1){
		                    temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"</b>";
		            	  }else if(dom.latterChk==0){
		            		temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"<br><br><input type=\"button\" value=\"후기작성\" onclick=latterWrite("+dom.no+")></b>";  
		            	  }
		              }else if(dom.delevery=="배송중"){
		              temp+="<b style=\"float: left; background-color:; flex-grow:1; text-align: center;\">"+dom.delevery+"<br><br><input type=\"button\" value=\"배송조회\" onclick=deleveryChk()></b>";  
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
				$("#extendedprice").html(productOrderTotalPrice);//총 구매액 보여주기.
				if(productOrderTotalPrice<500000){
					$("#grade").html("초보사장(2%)");  //어벤저스,대박사장,일반사장,초보사장
				}else if(productOrderTotalPrice>=500000&&productOrderTotalPrice<1000000){
					$("#grade").html("일반사장(3%)"); 
				}else if(productOrderTotalPrice>=1000000&&productOrderTotalPrice<1500000){
					$("#grade").html("대박사장(4%)"); 
				}else if(productOrderTotalPrice>=1500000){
					$("#grade").html("어벤저스(5%)"); 
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
	   window.open("/web/latterWrite.do?no="+no,"배송조회","width=600,height=580,top=100,left=200 resizable=no");
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
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////후원하기 버튼
        
        $("#a").hide();//후원 1 이미지
        $("#b").hide();//후원 2 이미지
        $("#c").hide();//후원 3 이미지
        $("#d").hide();//후원 4 이미지
        $("#e").hide();//후원 5 이미지
        $("#f").hide();//후원 6 이미지
        
        $("#supportbt").click(function(){
        	$("#a").show(1000);
            $("#b").show(1500);
            $("#c").show(2000);
            $("#d").show(2500);
            $("#e").show(2700);
            $("#f").show(2900);
        });
        
        $("#a,#b,#c,#d,#e,#f").mouseenter(function(){
        	
        	$("#"+this.id+"").css("z-index",1);//this.id를 해주면 마우스가 들어간 곳의 id를 빼올 수 있다.
        	$("#"+this.id+"").click(function(){//후원하고 싶은 아이를 클릭 했을때 발생한다.
        		
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
			<b style="background-color:; float: left; font-size: 17px;">마이페이지</b><br><br>
		</div>
	<div style="background-color:; width: 100%; padding-top: 5%; border-bottom: 1px solid gray; float: left;">
			<b style="background-color:; float: left; font-size: 13px; font-weight: bold; margin-top:10px; margin-bottom: 10px;">박찬일 <b style="font-size: 12px; color: gray;">님</b></b><br>
			
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1; ">회원그룹</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:bold; color:blue; flex-grow:3;" id="grade"></b><br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1; ">총구매액</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;" id="extendedprice"></b>원<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1;">후원적립금</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;"id="mileage">0</b>원<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex ; margin-top: 10px;">
	      <b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray; flex-grow:1;" >장바구니</b><br>
	      <b style="background-color:; text-align:right; font-size: 12px; font-weight:; color:powderblue; flex-grow:3;"id="cart"></b>개<br>		
	  </div>
	  <div align="right" style="background-color:; width:100%; display: block; display: flex; margin-top: 10px; margin-bottom: 15px;">
	     <input id="supportbt" type="button" value="후원하기" style="margin:0 auto ; width:70px ;height:30px ; background-color: white; font-weight: bold; border: 1px solid gray; font-size: 11px; color: red; border-radius: 10px 10px 10px 10px;">		
	  </div>
		</div>
		
		<div style="background-color:; width: 100%; padding-top: 20%; border-bottom: 1px solid gray; float: left;">
		   <b style="background-color:; text-align:left;  font-size: 14px; font-weight:900;">내쇼핑정보</b><br><br>
		   <a href="#" style="text-decoration: none; margin-top: 10px;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:gray;">주문내역·배송정보</b></a><br><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">1:1문의게시판</b></a><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">나의상품후기</b></a><br><br>
		   <a href="#" style="text-decoration: none; margin-top:;"><b style="background-color:; text-align:left;  font-size: 12px; font-weight:; color:black; ">나의상품문의</b></a><br><br><br>
		</div>
	</div>
	
		
	<div style="width: 58%; height: 500px; background-color:; float: left; margin-top: 10%; margin-left: 7%;">
		 <div style="float: left; background-color: white; width: 70%; margin-left:; margin-top:; margin-bottom: 1%;">
            <b style="font-size: 25px;">주문내역 · 배송조회</b>
         </div>
         <div style="float: left; width: 100%; margin-left:; background-color: white; border-top: 1px solid gray; border-bottom:; display: block;">
           <div style="width:100%; color:#99B0B0; float: left; background-color: #F6F6F6; font-size: 13px; padding-bottom:1.5% ; padding-top:1.5% ; display: flex;">
             <b style="float: left; background-color:;  flex-basis:11%;  text-align: center;">주문번호</b>
             <b style="float: left; background-color:;  flex-basis:19.9%;  text-align: center;">주문상품</b>
             <b style="float: left; background-color:;   flex-basis:11%; text-align: center;">주문수량</b>
             <b style="float: left; background-color:;  flex-basis:10%; text-align: center;">주문일시</b>
             <b style="float: left; background-color:;   flex-basis:11%; text-align: center;">주문금액</b>
             <b style="float: left; background-color:;  flex-basis:10.5%; text-align: center;">취소금액</b>
             <b style="float: left; background-color:; flex-basis:11%; text-align: center;">주문상태</b>
             <b style="float: left; background-color:; flex-grow:1; text-align: center;">배송정보</b>
          </div>
          <span id="container">
          </span>
          <div id="page" style="text-align: center; font-size: 13px; margin-top: 20px;  padding-top: 450px;">
         </div>
	  </div>
	  
     </div>
     
     <!--hidden 요소들  -->
     <input type="hidden" id="pageText" name="page" value="1">
     <img id="a" alt="" src="/web/store/support/쓰레기장.jpg" width="200px" height="200px" style="position: absolute; position: fixed; top:20% ; left: 20%; z-index: 0; cursor: pointer; ">
     <img id="b" alt="" src="/web/store/support/태양광랜턴2.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:30% ;left: 28%; z-index: 0; cursor: pointer;">
     <img id="c" alt="" src="/web/store/support/선물보내기.png" width="200px" height="200px"style="position: absolute; position: fixed; top:40% ;left: 36%; z-index: 0; cursor: pointer;">
     <img id="d" alt="" src="/web/store/support/소액기부.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:50% ;left: 44%; z-index: 0; cursor: pointer;">
     <img id="e" alt="" src="/web/store/support/주빌린후원.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:40% ;left: 52%; z-index: 0; cursor: pointer;">
     <img id="f" alt="" src="/web/store/support/씨유마이후원.jpg" width="200px" height="200px"style="position: absolute; position: fixed; top:30% ;left: 60%; z-index: 0; cursor: pointer;">
</body>
</html>