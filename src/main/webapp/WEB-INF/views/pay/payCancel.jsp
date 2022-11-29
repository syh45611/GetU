<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		alert("예약이 취소 되었습니다.");
		history.back();
	</script>
<!-- <script type="text/javascript">

     
app.post('/payments/cancel', async (req, res, next) => {
    try {
      /* 액세스 토큰(access token) 발급 */
      /* ... 중략 ... */
      /* 결제정보 조회 */
      const { body } = req;
      const { merchant_uid, reason, cancel_request_amount } = body; // 클라이언트로부터 전달받은 주문번호, 환불사유, 환불금액 
    	const merchant_uid = "merchant_1668061748512";
      Payments.find({ merchant_uid }, async function(err, payment) { 
 /*        /* ... 중략 ... */
    /*     const paymentData = payment[0]; // 조회된 결제정보
        const { imp_uid, amount, cancel_amount } = paymentData; // 조회한 결제정보로부터 imp_uid, amount(결제금액), cancel_amount(환불된 총 금액) 추출
        const cancelableAmount = amount - cancel_amount; // 환불 가능 금액(= 결제금액 - 환불 된 총 금액) 계산
        if (cancelableAmount <= 0) { // 이미 전액 환불된 경우
          return res.status(400).json({ message: "이미 전액환불된 주문입니다." });
        }  */ 
      
        /* 아임포트 REST API로 결제환불 요청 */
        const reason = "테스트";
        const imp_uid = "imp_954748952272";
        const getCancelData = await axios({
          url: "https://api.iamport.kr/payments/cancel",
          method: "post",
          headers: {
            "Content-Type": "application/json",
            "Authorization": "PlqJ2Uczn40sNHrtvzEZfwm3V9bqxFx2T5bffsMhLkuJqVJ2X2dZL3cJV3o0Va1SYL7cH1DnQBEy04eo" // 아임포트 서버로부터 발급받은 엑세스 토큰
          },
          data: {
            reason, // 가맹점 클라이언트로부터 받은 환불사유
            imp_uid, // imp_uid를 환불 `unique key`로 입력
            amount: 1000, // 가맹점 클라이언트로부터 받은 환불금액
            checksum: 1000 // [권장] 환불 가능 금액 입력
          }
        });
        const { response } = getCancelData.data; // 환불 결과
        /* 환불 결과 동기화 */
     
       
      });
    } catch (error) {
      res.status(400).send(error);
    
    }
  });
    

	
</script> -->
</head>
<body>

</body>
</html>