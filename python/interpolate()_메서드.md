# 결측치보간 interpolate() 메서드


EDA(탐색적 데이터 분석) 진행 시 결측치가 존재하는 것을 볼 수있다.
결측치를 버릴건지(drop), 혹은 채워주어야 한다.

그러나 데이터를 함부로 drop하여 머신러닝 예측을 진행한다는 것은 꽤 risk 하기도 하다.
결측치가 매우 적은 경우에는 그냥 버리는게 맞을 수 있지만
꽤 많이 존재하는 경우 혹은 예측해야할 test set의 feature 데이터에 존재하는 경우에는 결측치를 채워줄 수 밖에 없다.
시계열 데이터나 수치를 가지는 데이터의 경우 일종의 연속성이 있는 패턴을 발견할 수 있다.
이런 경우 보간(Interpolation)을 통해 앞,뒤값을 통하여 유추하여 좀 더 스마트하게 결측치를 채워줄 수 있다.
결측값 보간은 실측값 사이의 결측값을 마치 '그라데이터'기법으로 색깔을 조금씩 변화시켜가면서 부드럽게 채워나가는 방법이라고 이해해도 좋다.

### [Pandas 공식 도큐먼트](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.interpolate.html)

> DataFrame.interpolate(method='linear', 
						axis=0, 
                        limit=None, 
                        inplace=False, 
                        limit_direction=None, 
                        limit_area=None, 
                        downcast=None, 
                        **kwargs)


> 참고
>- https://rfriend.tistory.com/264
>- https://www.delftstack.com/ko/api/python-pandas/pandas-dataframe-dataframe.interpolate-function/
>- https://teddylee777.github.io/pandas/pandas-interpolation