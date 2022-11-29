<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
th, td {
	padding: 17px;
	text-align: center;
	font-size: 40px;
}
</style>

</head>
<body>
<script>
		var method = '${method}';
		var memberNo = '${memberNo}';
		var paySum = '${paySum}';
		var payType = '${payType}';
		var payNo = '${payNo}';
		var houseNo = '${houseNo}'
		window.onload = function() {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp02007576'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: method, 
            /* 
                'kakaopay':카카오페이, 
                'danal':다날
                'payco':페이코
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '게스트하우스',
            //결제창에서 보여질 이름
            amount: 1000, 
            //가격 
        /*     buyer_email: 'iamport@siot.do', */
            buyer_name: 'memberNo',
          /*   buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456', */
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
            	var payState = 1;
            	var merchant_uid = rsp.merchant_uid;
            	var	imp_uid = rsp.imp_uid;
                var msg = '결제가 완료되었습니다.';
                var sendData = {
            		"merchant_uid":merchant_uid, "imp_uid":imp_uid,
            		"method":method, "paySum":paySum,
            		"payType": payType, "memberNo":memberNo,
            		"payNo" : payNo, "payState":payState,
            		"houseNo" : houseNo
                }
                
                $.ajax({
                    url:'payComplete.do'
                    , method : 'POST'
                    , data: JSON.stringify(sendData)
                    ,contentType : 'application/json; charset=UTF-8'
                    ,dataType : 'json'
                    , success :function(resp){
                       /*  alert( JSON.stringify(sendData)); */
                        
                    }
                })	
                location.href="payComplete.do?payNo="+payNo+"&houseNo="+houseNo;
                
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
               location.href="houseContent.do?houseNo=1";
            }
      		alert(msg);
      		/* location.href="houseContent.do?houseNo=1";  */
      		
        }
        
        );
      };
	</script>

</body>
</html>