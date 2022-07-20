# Random Forest(랜덤포레스트)

![](https://velog.velcdn.com/images/silver0/post/14bb8fb1-73c0-4f13-a2aa-aaf810f189d1/image.png)

의사결정나무 모델 여러 개를 훈련시켜서 그 결과를 종합해 예측하는 앙상블 알고리즘이다.

주로 분류, 회귀에 사용되며, 앙상블에는 2가지 접근방법이 있다.
(1) 배깅(Bagging) 과 (2) 부스팅(Boosting) 기법

## 1. Bagging

bootstrap aggregating의 준말로서, 하나의 주어진 데이터에서 여러 개의 모델을 만들어 각 모델들 결과값의 평균을 통해 성능을 높이는 기법이다. 그리고 bootstrap이란 복원추출을 의미한다.

- 복원추출 기법
첫번째 시행: 주머니에서 공을 랜덤하게 하나 꺼냄
두번째 시행: 그 공을 주머니에 넣고, 다시 랜덤하게 뽑는 것

![](https://velog.velcdn.com/images/silver0/post/d356d719-6f16-4f03-952e-db7002298fcf/image.png)

부트스트랩을 B 번 반복하면 B 개의 데이터가 생성되며, 총 B 개의 모델이 생성되는 것이다. 5개의 각각의 모델에서의 예측결과에 따라서 분류라면 다수결로 결과를 결정하고, 회귀라면 평균으로 결과를 결정한다.

<br>

## 2. 부스팅기법
부스팅은 매 번 학습을 할 때마다 오분류된 확률변수에 대해 가중치를 부여한 후 다시 학습을 하며, 이 과정을 반복하면서 매 번의 결과들을 앙상블 하는 것이다.
![](https://velog.velcdn.com/images/silver0/post/5bb812ba-5eb8-48e7-acaa-d9dd7a48f3bf/image.png)


<br>
<br>

---

> Reference
>- https://github.com/pyohamen/Im-Being-Data-Scientist/wiki/Bagging,-Boosting
>- https://github.com/pyohamen/Im-Being-Data-Scientist/wiki/What-is-RandomForest%3F
