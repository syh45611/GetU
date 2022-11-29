<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ddbb7cc58de1557ddf2f1772d1e7d1c&libraries=services"></script>
<script type="text/javascript">
	var num = '${houseNo}';
	var num2 = '${houseNo}'+1;
	var chkI = '${chkIn}';
	var chkO = '${chkOut}';
	var page = '${page}';
	var pageNum='${pageNum}';
	var chkOO = new Date(new Date('${chkOut}').setDate(new Date('${chkOut}')
			.getDate() - 1));
	var year = chkOO.getFullYear();
	var month = ('0' + (chkOO.getMonth() + 1)).slice(-2);
	var day = ('0' + chkOO.getDate()).slice(-2);
	var chkDate = year + '-' + month + '-' + day;
</script>
<script type="text/javascript">
	$(function() {
		$('#roomInfo').load(
				"roomList.do?houseNo=" + num + "&chkIn=" + chkI + "&chkOut="
						+ chkO);
	});
	
	
	$(function() {
		$('#roomCont').load(
				"roomListContent.do?houseNo=" + num + "&chkIn=" + chkI
						+ "&chkOut=" + chkDate);
	});
	$(function() {
		$('#map2').load("map.do?houseNo=" + num);
	});
	
	if(page == 0){
	$(function() {
		$('#reviewContent').load("reviewCont.do?houseNo=" + num);
	});
	}else{
		$(function() {
			$('#reviewContent').load("reviewCont.do?houseNo=" + num+"&pageNum="+pageNum);
		});
	}
</script>
<script>
	$(function() {
		$('#onReservation').click(function() {
			$('#roomInfo').show();
			$('#reviewContent').hide();
			$('#map2').hide();
		});
	});
	$(function() {
		$('#onInfo').click(function() {
			$('#roomInfo').hide();
			$('#reviewContent').show();
			$('#map2').hide();
		});
	});
	$(function() {
		$('#onMap').click(function() {
			$('#roomInfo').hide();
			$('#reviewContent').hide();
			$('#map2').show();
			map.relayout();
			map.setCenter(coords);
		});
	});
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="호텔주소입니다">
<meta name="description" content="">
<title>Home</title>
<link rel="stylesheet" href="resources/testImage/nicepage.css"
	media="screen">
<link rel="stylesheet" href="resources/houseContent/Home.css"
	media="screen">
<script class="u-script" type="text/javascript"
	src="resources/bootstrap/js/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript"
	src="resources/houseContent/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.21.5, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">



<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="Home">
<meta property="og:type" content="website">
</head>
<body>
 <body class="u-body u-xl-mode" data-lang="en">
    <section class="u-clearfix u-section-1" id="sec-0432">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-align-left u-text u-text-1">${house.houseName }</h1>
        <div class="u-carousel u-gallery u-gallery-slider u-layout-carousel u-lightbox u-no-transition u-show-text-on-hover u-gallery-1" id="carousel-f035" data-interval="5000" data-u-ride="carousel">
          <ol class="u-absolute-hcenter u-carousel-indicators u-carousel-indicators-1">
            <li data-u-target="#carousel-f035" data-u-slide-to="0" class="u-active u-grey-70 u-shape-circle" style="width: 10px; height: 10px;"></li>
            <li data-u-target="#carousel-f035" data-u-slide-to="1" class="u-grey-70 u-shape-circle" style="width: 10px; height: 10px;"></li>
          </ol>
          <div class="u-carousel-inner u-gallery-inner" role="listbox">
            <div class="u-active u-carousel-item u-effect-fade u-gallery-item u-carousel-item-1">
              <div class="u-back-slide">
                <img class="u-back-image u-expanded" src="resources/images/${houseNo}.jpg">
              </div>
            </div>
            <div class="u-carousel-item u-effect-fade u-gallery-item u-carousel-item-2">
              <div class="u-back-slide">
                <img class="u-back-image u-expanded" src="resources/imagePlus/${houseNo}.jpg">
              </div>
            </div>
          </div>
          <a class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-carousel-control-1" href="#carousel-f035" role="button" data-u-slide="prev">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
          </a>
          <a class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-carousel-control-2" href="#carousel-f035" role="button" data-u-slide="next">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
          </a>
        </div>
        <h4 class="u-text u-text-palette-1-base u-text-2">★ ${reviewAvg}</h4>
        <h5 class="u-text u-text-3">${house.houseAddr }<br>
        </h5>
        <div class="u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-2">
          <div class="u-gallery-inner u-gallery-inner-2">
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide">
                <img class="u-back-image u-expanded" src="resources/imageRoom/1.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-3">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide">
              	 <img class="u-back-image u-expanded" src="resources/imageRoom/2.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-4">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide">
               <img class="u-back-image u-expanded" src="resources/imageRoom/3.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-5">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
          </div>
        </div>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <a id="onReservation" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-btn u-button-style u-custom-item u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-1">
                예약</a>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <a id="onMap" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-btn u-button-style u-custom-item u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-2">
                정보</a>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <a id="onInfo" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-btn u-button-style u-custom-item u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-3">
                리뷰</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

	<c:if test="${page == 0 }">
    <section class="u-clearfix u-section-2" id="sec-36ec">
    <div class="u-clearfix u-sheet u-sheet-1" id="roomInfo"></div>
   <!--  <div class="u-clearfix u-sheet u-sheet-1" id="roomCont"></div> -->
    <div class="u-clearfix u-sheet u-sheet-1" id="map2" style="display: none;
     position: relative; left: 110px; top: 1px;"></div>
    <div class="u-clearfix u-sheet u-sheet-1" id="reviewContent" style="display: none;"></div>
    </section>
    </c:if>
    <c:if test="${page > 0 }">
    <section class="u-clearfix u-section-2" id="sec-36ec">
    <div class="u-clearfix u-sheet u-sheet-1" id="roomInfo" style="display: none;"></div>
   <!--  <div class="u-clearfix u-sheet u-sheet-1" id="roomCont"></div> -->
    <div class="u-clearfix u-sheet u-sheet-1" id="map2" style="display: none;
     position: relative; left: 110px; top: 1px;"></div>
    <div class="u-clearfix u-sheet u-sheet-1" id="reviewContent" ></div>
    </section>
    </c:if>
   <!--   <button id="onReservation">객실안내/예약</button>
	<button id="onInfo">리뷰</button>
	<button id="onMap">숙소정보</button> -->
<!-- <div id="roomInfo" align="center"></div>
	<div id="roomCont" align="center"></div>
	<div id="map2" align="center"
		style="display: none; width: 710px; height: 444px;"></div>
	<div id="reviewContent" align="center" style="display: none;"></div> -->
</body>


</html>