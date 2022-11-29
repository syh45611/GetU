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
<style type="text/css">
.star-ratings {
   color: #aaa9a9;
   position: relative;
   unicode-bidi: bidi-override;
   width: max-content;
   -webkit-text-fill-color: transparent;
   /* Will override color (regardless of order) */
   -webkit-text-stroke-width: 1.3px;
   -webkit-text-stroke-color: #2b2a29;
   font-size: 40px;
}

.star-ratings-fill {
   color: #86b6f6;
   padding: 0;
   position: absolute;
   z-index: 1;
   display: flex;
   top: 0;
   left: 0;
   overflow: hidden;
   -webkit-text-fill-color: #86b6f6;
}

.star-ratings-base {
   z-index: 0;
   padding: 0;
}

.aval {
   vertical-align: bottom;
}

#a {
   color: #86b6f6;
   text-align: left;
   margin-top: 0px;
   margin-bottom: 20px;
   font-size: 25px;
}

#b {
   margin-top: 0px;
   margin-bottom: 30px;
}

#c {
   font-size: 25px;
}

#ulc {
   margin-top: 0px;
   margin-bottom: 10px;
}
</style>
</head>
<body>
   <div align="center">
      <table
         style="border-right: none; border-left: none; border-color: #86b6f6;">
         <tr style="border-color: #86b6f6;">
            <td style="width: 320; border-right: none; border-left: none"></td>
            <td
               style="text-align: right; width: 230px; border-right: none; border-left: none"><div
                  class="star-ratings">
                  <div class="star-ratings-fill space-x-2 text-lg"
                     style="width: ${reviewAval * 20 +1.5 }%">
                     <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                  </div>
                  <div class="star-ratings-base space-x-2 text-lg">
                     <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                  </div>
               </div></td>
            <td
               style="font-size: 35px; text-align: left; width: 400px; border-right: none; border-left: none">${reviewAval}</td>
         </tr>
      </table>
   </div>


   <div style="min-height: 2500px; padding-left: 81px; padding-top: 15px;"
      align="center">



      <c:forEach var="review" items="${reviewList}">
         <div
            style="min-height: 300px; padding-left: 0px; border-style: solid; border-color: #423d3d12 white white white;"
            align="center">
            <ul id="ulc" style="list-style-type: none; height: 95px;">

               <li
                  style="width: 120px; height: 250px; list-style-type: none; float: left; padding-top: 20px;">
                  <img alt="프로필사진" src="resources/images/0.png" width="110px">
               </li>
               <li
                  style="width: 200px; height: 100px; list-style-type: none; float: left;">
                  <ul id="ulc" style="float: left; padding-left: 15px;">
                     <li
                        style="width: 800px; list-style-type: none; height: 45px; text-align: left;"><p
                           id="c">${review.reviewSubject}</li>
                     <li style="width: 800px; list-style-type: none; height: 50px;"><p
                           id="a">★${review.reviewScore}</li>
                     <li
                        style="width: 800px; list-style-type: none; height: 220px; text-align: left;"><p
                           id="b">${review.reviewContent}</li>
                  </ul>
               </li>
            </ul>
         </div>
      </c:forEach>
      <div align="center" id="page_btn">
         <ul class="pagination_bottom">
            <!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
            <c:if test="${pb.startPage > pb.pagePerBlock }">
               <button
                  onclick="location.href='houseContent.do?pageNum=1&houseNo=${houseNo}'">
               </button>
               <button
                  onclick="location.href='houseContent.do?pageNum=${pb.startPage - 1 }&houseNo=${houseNo}'">
               </button>
            </c:if>
            <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
               <!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
               <c:if test="${pb.currentPage == i }">
                  <button style="background-color: #86b6f6"
                     onclick="location.href='houseContent.do?pageNum=${i }&houseNo=${houseNo}'">${i}
                  </button>
               </c:if>
               <c:if test="${pb.currentPage != i }">
                  <button
                     onclick="location.href='houseContent.do?pageNum=${i }&houseNo=${houseNo}'">${i}
                  </button>
               </c:if>
            </c:forEach>
            <!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
            <c:if test="${pb.endPage < pb.totalPage }">
               <button
                  onclick="location.href='houseContent.do?pageNum=${pb.endPage + 1 }&houseNo=${houseNo}'">
               </button>
               <button
                  onclick="location.href='houseContent.do?pageNum=${pb.totalPage }&houseNo=${houseNo}'">
               </button>
            </c:if>
         </ul>
      </div>
   </div>

</body>
</html>