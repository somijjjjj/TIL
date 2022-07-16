# Decision Tree Regression (의사결정나무)

<br>
<br>

![](https://velog.velcdn.com/images/silver0/post/92df666c-64e6-467a-88a7-9deeb09f6736/image.png)

# 의사결정나무란?
결정트리는 의사 결정 규칙과 그 결과들을 트리 구조로 도식화한 의사 결정 지원 도구의 일종이다.
즉, 스무고개 방식으로 구조화되는 것

- 여러가지 규칙을 순차적으로 적용하면서 독립 변수 공간을 분할하는 분류 모형이다.
- **분류(classification)와 회귀 분석(regression)에 모두 사용**될 수 있기 때문에 <span style="background-color:#3c6382">CART(Classification And Regression Tree)</span>라고 한다.
- 각 행(row)들 중 하나의 피쳐를 정해서 해당 피쳐의 값에 대해 특정한 하나의 값을 정한다면, 이를 기준으로 모든 행(row)들을 두 개의 노드(node)로 분류(Binary decision rule, 이진분할)할 수 있다. *만약 특정하게 2개를 정한다면 삼진분할이 된다*
- 즉, 지도 학습용 데이터가 주어졌을 때 특성변수의 특징을 이용해서 자료를 분할해가는 과정
- 이때 분할되는 각각의 자료들은 목표변수를 기준으로 비슷한 자료들끼리 서로 뭉치도록 만들어주는 것, Y가 유사해지도록 데이터를 분할해가는 과정
- 나무 모양처럼 도식화가 되어있고 예측하는 과정을 나무 모양을 보면서 쉽게 해석할 수 있다는 장점이 있다.

<br>

![](https://velog.velcdn.com/images/silver0/post/5acf6783-a88d-406a-b75f-053273798797/image.png)


- 전체 학습데이터 집합(부모 노드)을 해당 독립 변수의 값이 기준값보다 작은 데이터 그룹(자식 노드1)과 해당 독립 변수의 값이 기준값보다 큰 데이터 그룹(자식 노드2)로 나눈다.
- 각각의 자식 노드에 대해 위 단계를 반복하여 하위의 자식 노드를 만든다. 단, 자식 노드에 한가지 클래스의 데이터만 존재한다면 더 이상 자식 노드를 나누지 않고 중지한다.
- 자식 노드 나누기를 연속적으로 적용하면 노드가 계속 증가하는 나무(tree)와 같은 형태이다.

<br>

특정한 값을 정하는 의사결정 나무의 대원칙은 "한쪽 방향으로 쏠리도록" 피쳐의 값을 찾는 것이며,
이는 <span style="background-color:#3c6382">불순도(impurity)와 불순도의 향상도(Goodness of split)</span>를 계산해 찾아낸다.

<br>
<br>

# 불순도(Impurity)

어떠한 피쳐의 어떤 값을 기준으로 삼아야 할지를 정하는 기준을 불순도이다.
가능한 모든 기준값에 대해 불순도를 계산한 후(Greedy Search) 이 중 가장 낮은 불순도를 갖는 기준값으로 분류한다.

<br>

### Gini impurity

> $imp(t)=1-\sum_{j=1}P^2_{j}$

CART 나무에서 쓰는 지니불순도는 한 노드 안에서 불순도를 계산할 수 있다.
P는 노드 안의 각 확률변수의 확률값이고 불순도가 높다는 것은 확률변수들이 치우치지 않고 각 확률변수의 수가 같다는 의미인데,
*이에 따라 k=2일 때, max=0.5가 되고, k=4일 때, max=0.75가 됨을 알 수 있다. *

<br>

### Goodness of split
이진분할 같은 경우는 노드가 두 개로 나뉘게 되는데 이때 각 노드의 불순도의 가중평균 값을 고려하게 된다.
분할하기 전 노드를 t라고 하고, 분할 후 노드를 t1, t2라고 했을 때,
> 향상도(Goodness of split) = (노드t의 불순도) - (t1과 t2 노드의 불순도 가중평균)

Greedy Search로 가장 높은 향상도를 갖는 기준값으로 분할하게 된다.

<br>

### 불순도의 종류
- 지니불순도 (CART):
	$imp(t)=1-\sum_{j=1}P^2_{j}$

- 엔트로피 (C4.5):
	$imp(t)=-\sum_j^kp_jlog(p_j)$

- 이탈도: 이탈도를 이용한 의사결정 나무는 없습니다
	$imp(t)=-2\sum_j^kn_jlog(p_j)$


<br>
<br>


###

# 의사결정나무 구조
- Graph Model
- 구성요소
  - 뿌리노드 (root node) : 시작되는 마디로 전체 자료로 구성
  - 자식마디 (child node) : 하나의 마디로부터 분리되어 나간 2개 이상의 마디들
  - 부모마디 (parent node) : 주어진 마디의 상위마디
  - 중간노드 (internal node) : 부모마디와 자식마디가 모두 있는 마디
  - 최종노드 (terminal node) : 자식마디가 없는 마디~ 끝마디의 Y값들을 이용하여 예측
  - 깊이 (depth) : 뿌리마다 끝마디까지 중간마디의 수

<br>
<br>


# CART 의사결정나무
- Breiman, Friedman, etc. 1984
- Binary decision rule
- 연속형 변수 부등호 활용
- 범주형 변수 부분집합 활용
- Divide-and-conquer approach
- Greedy search using impurity measure
- 한 번에 변수 한개씩 (One variable at a time)

<br>
<br>

---

> Reference
> - https://riverzayden.tistory.com/6
> - https://github.com/pyohamen/Im-Being-Data-Scientist/wiki/what-is-decision-tree%3F
> - https://github.com/pyohamen/Im-Being-Data-Scientist/wiki/%EB%B6%88%EC%88%9C%EB%8F%84,-%ED%96%A5%EC%83%81%EB%8F%84
> - https://blog.naver.com/gngn546/222679664078

