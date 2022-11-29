<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous">
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, th, td {
   border: 1px solid #bcbcbc;
   border-collapse: collapse;
}

.jb-th-1 {
   width: 380px;
   height: 50px;
   font-size: 23px;
}

.jb-th-2 {
   width: 165px;
   height: 50px;
   text-align: center;
   font-size: 23px;
}

.jb-th-3 {
   width: 135px;
   height: 50px;
   font-size: 23px;
}

.jb-th-4 {
   width: 110px;
   height: 50px;
   font-size: 23px;
}

td {
   padding: 15px;
   text-align: center;
   height: 100px;
   font-size: 23px;
}
</style>
<script type="text/javascript">
function chk(name) {
   if (${memberId == null}) {
      alert("로그인 후 이용해 주시기 바랍니다.");         
      return false;
   } 
}
</script>
</head>
<body>
   <form action="resevChkList.do" onsubmit="return chk()">
      <input type="hidden" value="${chkIn}" name="chkIn"> 
      <input type="hidden" value="${chkOut}" name="chkOut"> 
      <input type="hidden" value="${houseNo}" name="houseNo"> 
      <input type="hidden" value="${Days}" name="Days">
      <table border="1" class="ta">
         <tr>
            <th class="jb-th-1">방 내부</th>
            <th class="jb-th-3">방 이름</th>
            <th class="jb-th-4">인원</th>
            <th class="jb-th-2">총 ${Days} 박 금액</th>
            <th class="jb-th-4">수량</th>
            <c:if test="${empty oneDayRoomList}">
               <c:if test="${empty CanRoomList}">
                  <tr>
                     <td colspan="5">
                        <p style="color: red;">이용가능한 방이 없습니다</p>
                     </td>
                  </tr>
               </c:if>
            </c:if>
            <c:if test="${not empty CanRoomList}">
               <c:forEach var="room" items="${CanRoomList}">
                  <tr>
                     <td><img src="resources/imageRoomDetail/${room.roomType}.jpg" width="350"></td>
                        <td style="font-weight: 800;">${room.roomName}<input type="hidden" value="${room.roomType}" name="roomType"></td>
                     	  <td><img src="resources/roomCapa/${room.roomType}.jpg" width="80"></td>
		                     <c:if test="${room.roomRemain == 0}">
		                        <td colspan="2"><p style="color: red;">마감</p> 
		                        <input type="hidden" name="roomCount" value="0"></td>
		                     </c:if>
                     		 <c:if test="${room.roomRemain != 0}">
                       			 <td>&#8361;${room.roomPrice }</td>
                        		<td><c:if test="${room.roomRemain != 0}">
                       				 <p style="font-size: 15px; color: red; opacity: 0.6;">잔여객실: ${room.roomRemain}</p>
                             	 <select name="roomCount" id="remain" class="remainBu">
                                 <c:forEach var="rom" begin="0" end="${room.roomRemain}">
                                    <option value="${rom}">${rom}</option>
                                 </c:forEach>
                              </select>
                              <input type="hidden" value="roomCount" id="remain">
                           </c:if></td>
                     </c:if>
                  </tr>
               </c:forEach>
            </c:if>
            <c:if test="${not empty oneDayRoomList}">
               <c:forEach var="room" items="${oneDayRoomList }">
                  <tr>
                     <td><img src="resources/imageRoomDetail/${room.roomType}.jpg" width="350"></td>
                    	 <td style="font-weight: 800;">${room.roomName}<input type="hidden" value="${room.roomType}" name="roomType"></td>
						 <td><img src="resources/roomCapa/${room.roomType}.jpg" width="80"></td>
                     <td><c:if test="${room.roomRemain == 0}">
                           <p style="color: red;">마감</p>
                        </c:if> <c:if test="${room.roomRemain != 0}">
                  			&#8361;${room.roomPrice }
               		    </c:if></td>
                     <td><c:if test="${room.roomRemain == 0}">
                           <p style="color: red;">마감</p>
                           <input type="hidden" name="roomCount" value="0">
                        </c:if> <c:if test="${room.roomRemain != 0}">
                        		<p style="font-size: 15px; color: red; opacity: 0.6;">잔여객실: ${room.roomRemain}</p>
                           <select name="roomCount" id="remain" class="remainBu">
                              <c:forEach var="rom" begin="0" end="${room.roomRemain}">
                                 <option value="${rom}">${rom}</option>
                              </c:forEach>
                           </select>
                           <input type="hidden" value="roomCount" id="remain">
                        </c:if>
                       </td>
                  </tr>
               </c:forEach>
            </c:if>
         <tr>
            <c:if test="${Button != 0}">
               <th colspan="5" align="center" style="padding: 15px;">
               <input  type="submit" value="예약하기"  style="font-size: 25px; background: #86b6f6; color: white;"></th>
            </c:if>
         </tr>
      </table>
   </form>
</body>
</html>