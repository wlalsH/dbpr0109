<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 확인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%@include file="/WEB-INF/basicBar.jsp" %>
	<c:if test="${exception ne null}">
		<div style="padding: 50px;">
			<div>
				<b style="font-size: 40px">품절</b>
			</div>
				${exception }<br> (함께 주문하신 다른 상품들도 같이 주문되지 않습니다.)
		</div>
	</c:if>
	<c:if test="${exception eq null}">
		<div style="padding: 50px;">
			<div>
				<b style="font-size: 40px">주문이 완료되었습니다.</b>
			</div>
			<div class="container">
		  		<div class="row">
		  			<div class="col">
		     		주문 번호
		    		</div>
		    		<div class="col">
		     		상품
		    		</div>
		   			<div class="col">
		      		상품 이름
		    		</div>
		    		<div class="col">
		      		개수
		    		</div>
		  		</div>
			</div>
			<c:forEach var="item" items="${items}">
				<div class="container">
		  			<div class="row">
		  				<div class="col">
		     			${item.orderId}
		    			</div>
		    			<div class="col">
		     			<img src="${item.image}" width="100px" />
		    			</div>
		   				<div class="col">
		      			${item.productName}
		    			</div>
		    			<div class="col">
		      			${item.quantity}
		    			</div>
		  			</div>
				</div>
			</c:forEach>
	 	</div>
 	</c:if>
 	<div class="row mb-3"  style="padding: 50px;">
	    	<button type="button" class="btn btn-primary" style="background-color: black; color: #c5dc63;" onClick="location.href='<c:url value="/main"/>'"><b>메인 페이지</b></button>
	 </div> 
</body>
</html>