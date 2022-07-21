# 삽입 정렬(Insertion Sort)

<span style="background-color:#8c7ae6">수열의 왼쪽부터 순서대로 정렬하는 방식</span>이다.  
미탐색 영역에서 숫자를 하나 꺼내서 정렬이 끝난 영역의 적절한 위치에 삽입해 나간다.

- 자료 배열의 모든 요소를 앞에서부터 차례대로 이미 정렬된 배열 부분과 비교하여 자신의 위치를 찾아 삽입함으로써 정렬을 완성하는 알고리즘
- 매 순서마다 해당 원소를 삽입할 수 있는 위치를 찾아 해당 위치에 넣는다


<img src="https://upload.wikimedia.org/wikipedia/commons/2/25/Insertion_sort_animation.gif">
<img src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Insertion_sort_001.PNG">

[참고] https://ko.wikipedia.org/wiki/%EC%82%BD%EC%9E%85_%EC%A0%95%EB%A0%AC


<img src="https://i.imgur.com/SOsBJt1.gif">


1. 처음에는 왼쪽 끝의 수를 정렬이 끝난 상태로 간주한다.
2. 미탐색 영역의 왼쪽 끝에 있는 수를 정렬이 끝난 영역의 수와 비교하며 위치를 교체한다.
3. 같은 방식으로 미탐색 영역의 모든 값이 정렬될 때까지 (1)~(2)를 반복한다.

삽입 정렬에서는 각 라운드의 첫 숫자를 그 왼쪽에 있는 숫자와 비교하는데, 만약 왼쪽에 있는 숫자가 작다면 교체가 발생하지 않는다.  
미탐색 영역에서 정렬할 대상 숫자가 정렬이 끝난 영역의 숫자보다 작을 때는 그 숫자가 가장 왼쪽에 도착할 때까지 비교와 교체작업을 하게 된다.  
구체적으로 k운드에서는 k-1회씩 작업을 하는데, 최악의 경우에는 2라운드에서 1회, 3라운드에서 2회, ..., n라운드에서 n-1회의 비교와 교체가 발생하므로 계산 시간이 버블 정렬이나 선택 정렬과 같이 O(n^2)가 된다.  

<br>
<br>

# 특징
장점
- 추가 메모리가 필요없다.
- 구현이 간단하다.
- 같은 값의 원소 순서를 유지한다.(안정 정렬)
- 값이 적을 경우 알고리즘 자체가 매우 간단하므로 다른 복잡한 정렬 방법보다 유리할 수 있다.
- 대부분 레코드가 이미 정렬되어 있는 경우에는 매우 효율적일 수 있다.  

단점
- 비교적 많은 값들의 이동을 포함한다.
- 배열이 길어질수록 효율이 떨어진다.

<br>

- Best T(n) = O(n)
- Worst T(n) = O(n$^2$)

<br>

# 복잡도 분석
삽입 정렬은 별도의 추가 공간을 사용하지 않고 주어진 배열이 차지하고 있는 공간 내에서 값들의 위치만 바꾸기 때문에 O(1)의 공간 복잡도를 가진다.
시간 복잡도는 우선 루프문을 통해 정렬 범위를 2개로 시작해서 전체로 확장해야 하기 때문에 기본적으로 O(N)을 시간을 소모하며, 각 패스에서는 정렬 범위에 새롭게 추가된 값과 기존 값들의 대소 비교 및 자리 교대를 위해서 O(N)을 시간이 필요하게 된다.  
- 삽입 정렬은 총 O(N^2)의 시간 복잡도를 가지는 정렬 알고리즘  

아래에서 다룰 최적화를 통해서 부분적으로 정렬된 배열에 대해서 성능을 대폭 개선할 수 있으며, 특히 완전히 정렬되어 있는 배열이 들어올 경우, O(N)까지도 시간 복잡도를 향상시킬 수 있다.

<br>

## 소스코드

### python
```python
def insert_sort(x):
	for i in range(1, len(x)):
		j = i - 1
		key = x[i]
		while x[j] > key and j >= 0:
			x[j+1] = x[j]
			j = j - 1
		x[j+1] = key
	return x
```
### Java
```java
void insertionSort(int[] arr)
{

   for(int index = 1 ; index < arr.length ; index++){

      int temp = arr[index];
      int aux = index - 1;

      while( (aux >= 0) && ( arr[aux] > temp ) ) {

         arr[aux + 1] = arr[aux];
         aux--;
      }
      arr[aux + 1] = temp;
   }
}
```

---

<br>
<br>

> Reference
>- 『알고리즘 도감』, 이시다 모리테루, 미야자키 쇼이치 - 제이펍
>- https://ko.wikipedia.org/wiki/%EC%A0%95%EB%A0%AC_%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98
>- https://cloudstudying.kr/courses/59
>- https://codepumpkin.com/category/algorithms/
>- https://gmlwjd9405.github.io/tags#algorithm
>- https://www.daleseo.com/sort-merge/