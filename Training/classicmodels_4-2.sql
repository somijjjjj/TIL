/* 테이블 로드 */
USE classicmodels;
SELECT * FROM customers;

/* 일별 매출액 조회 */
SELECT A.orderDate,								 # 판매일자
	sum(B.priceEach*B.quantityOrdered) AS sales  # 판매금액*판매수량 합계
FROM classicmodels.orders A						 # A order 테이블 가져오기
LEFT JOIN classicmodels.orderdetails B			 # B orderdetails 테이블과 join
ON A.orderNumber = B.orderNumber				 # orderNumber 기준으로 
GROUP BY 1										 # 첫번째 컬럼 기준으로 그룹핑
ORDER BY 1;										 # 첫번째 컬럼 기준으로 오름차순 정렬

/* 월별 매출액 조회*/
SELECT substr(A.orderDate, 1, 7) MM, 			# 판매일에서 yyyy-mm만 추출
	sum(B.priceEach*B.quantityOrdered) AS sales
FROM classicmodels.orders A
LEFT JOIN classicmodels.orderdetails B		
ON A.orderNumber = B.orderNumber				 
GROUP BY 1										 
ORDER BY 1;	

/* 연도별 매출액 조회*/
SELECT substr(A.orderDate, 1, 4) YY, 			# 판매일에서 yyyy만 추출
	sum(B.priceEach*B.quantityOrdered) AS sales
FROM classicmodels.orders A
LEFT JOIN classicmodels.orderdetails B		
ON A.orderNumber = B.orderNumber				 
GROUP BY 1										 
ORDER BY 1;	

/*구매자 조회*/
SELECT orderDate,
	customerNumber,
    orderNumber
FROM classicmodels.orders
ORDER BY 2
;

/*주문번호 COUNT 와 주문번호 distinct count 비교*/
SELECT COUNT(orderNumber) n_orders,
COUNT(DISTINCT orderNumber) n_orders_distinct
FROM classicmodels.orders
ORDER BY 2
;

/*일자별 구매자 수, 주문건수 조회*/
SELECT orderDate,
COUNT(DISTINCT customerNumber) n_purchasers,	# 구매자 수
COUNT(DISTINCT orderNumber) n_orders			# 주문건수
FROM classicmodels.orders
GROUP BY 1
ORDER BY 1
;

/*월별 구매자 수, 주문건수 조회*/
SELECT substr(orderDate, 1, 7) MM,
COUNT(DISTINCT customerNumber) n_purchasers,	# 구매자 수
COUNT(DISTINCT orderNumber) n_orders			# 주문건수
FROM classicmodels.orders
GROUP BY 1
ORDER BY 1
;

/*연도별 구매자 수, 주문건수 조회*/
SELECT substr(orderDate, 1, 4) YY,
COUNT(DISTINCT customerNumber) n_purchasers,	# 구매자 수
COUNT(DISTINCT orderNumber) n_orders			# 주문건수
FROM classicmodels.orders
GROUP BY 1
ORDER BY 1
;

/* 연도별 매출액, 구매자 수 조회*/
SELECT substr(A.orderDate, 1, 4) YY, 				# 판매일에서 yyyy만 추출
	COUNT(DISTINCT A.orderNumber) n_orders, 		# 구매자 수 count
	sum(B.priceEach*B.quantityOrdered) sales, 		# 매출액
    sum(B.priceEach*B.quantityOrdered) / COUNT(DISTINCT A.orderNumber) atv
FROM classicmodels.orders A
LEFT JOIN classicmodels.orderdetails B		
ON A.orderNumber = B.orderNumber				 	# 주문번호 기준 join
GROUP BY 1										 	# 연도별 그룹핑
ORDER BY 1;	

