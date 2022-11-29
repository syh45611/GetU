<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ddbb7cc58de1557ddf2f1772d1e7d1c&libraries=services"></script>
</head>
<body>
	<h4 style="font-weight: 800;">기본정보</h4>
	<div style="position: relative; left: 45px; top: 20px;">
		<h6 style="font-weight: 700;">주차장 정보</h6>
		<ul>
			<c:forEach var="parking" items="${parking}">
				<li style="font-weight: 200;">${parking.parkcontent }</li>
			</c:forEach>
		</ul>
		<h6 style="font-weight: 700;">지하철 정보</h6>
		<ul>
			<c:forEach var="subway" items="${subway}">
				<li style="font-weight: 200;">${subway.subwaycontent }</li>
			</c:forEach>
		</ul>
		<h6 style="font-weight: 700;">객실 추가정보</h6> 
		<ul>
			<c:forEach var="info" items="${info}">
				<li style="font-weight: 200;">${info.infocontent }</li>
			</c:forEach>
		</ul>
	</div>
	<div id="map" style="width: 860px; height: 350px; top: 35px;" ></div>
	<div style="top:50px"></div>
	<script>
	    var inputData = ['${house.houseAddr}'];
	 
	    var mapContainer = document.getElementById('map'),
	        mapOption = 
	        {
	            center: new kakao.maps.LatLng(37.54699, 127.09598),
	            level: 4
	        };
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	    var count = 0;
	    var ps = new kakao.maps.services.Places();
	    var bounds = new kakao.maps.LatLngBounds();
	    var coords = null;
	    
	    if (inputData != null) 
	    {
	        kewwordSearch(inputData[count]);
	    }
	 
	    function kewwordSearch(keword) 
	    {
	        ps.keywordSearch(keword, placesSearchCB);
	        count = count + 1;
	    }
	 
	    function placesSearchCB(data, status, pagination) 
	    {
	        if (status === kakao.maps.services.Status.OK) 
	        {
	            displayMarker(data[0]);
	            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
	            coords = new kakao.maps.LatLng(data[0].y, data[0].x);
	            
	            if (count < inputData.length) 
	            {
	                kewwordSearch(inputData[count]);
	            } 
	            else if (count == inputData.length) 
	            {
	                setBounds();
	            }
	        }
	    }
	 
	    function displayMarker(place) 
	    {
	        var marker = new kakao.maps.Marker(
	        {
	            map: map,
	            position: new kakao.maps.LatLng(place.y, place.x),
	        });
	        
	        kakao.maps.event.addListener(marker, 'click', function () 
	        {
	            var position = this.getPosition();
	            var url = 'https://map.kakao.com/link/map/' + place.id;
	            window.open(url, '_blank');
	        });
	        
	        var infowindow = new kakao.maps.InfoWindow(
			{
				content : '<div style="width:150px;font-size:11px;text-align:center;padding:2px 0;">'+'${house.houseName}'+'</div>'
			});
			
	        infowindow.open(map, marker);
	    }
	 
	    function setBounds() 
	    {
	        map.setBounds(bounds, 90, 30, 10, 30);
	    }
	</script>
</body>
</html>