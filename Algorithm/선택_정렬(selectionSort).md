# 선택 정렬(selection sort)
<span style="background-color:#8c7ae6">수열 중에서 최솟값을 검색해서 왼쪽 끝에 있는 숫자와 교체하는 작업</span>을 반복한다.  
수열 중에서 최솟값을 찾을 때는 <span style="color:#8c7ae6">**선형 탐색**</span>을 사용한다.

> 선형탐색?  
배열에서 앞에서부터 순서대로 데이터를 탐색하는 알고리즘.  
이진 탐색과 달리 데이터가 질서정연하게 나열되어 있지 않아도 적용할 수 있다.  
> - T(n) = O(n)

<br>

<img src="https://i.imgur.com/qrbD54n.gif">

1. 수열을 선형 탐색해서 최솟값을 찾는다.
2. 최솟값을 왼쪽 끝에 있는 수와 교체한 뒤 정렬이 끝난 것으로 간주한다.
3. 모든 값이 정렬될 때까지 (1)~(2) 작업을 반복한다.

선택 정렬은 1라운드에서 n-1회, 2라운드에서 n-2회, ... n라운드에서 1회를 비교한다.  
이 때문에 비교 횟수는 `(n-1)+(n-2)+ … + 2 + 1 = n(n-1)/2` 이다. *- 버블정렬과 같다*  
또한, 숫자 교체는 각 라운드에서 최대 1회이다. 입력 데이터가 작은 순으로 나열돼 있다면 교체는 한 번도 발생하지 않는다. 따라서 시간복잡도는 O(n^2)가 된다.  
선택 정렬은 알고리즘이 단순하며 사용할 수 있는 메모리가 제한적인 경우에 사용시 성능 상의 이점이 있다.  

선택 정렬에서는최대 n개의 교환 작업이 필요하지만, 버블 정렬에서는 각 요소에 대해 최대 n개의 교환 작업이 발생하므로 최대 n$^2$개의 교환 작업이 필요하다.  
이러한 교환 작업은 메모리를 많이 사용하므로 큰 배열의 경우 선택 정렬이 버블 정렬보다 훨씬 더 효율적이다.  
*선택 정렬은 일반적으로  메모리 쓰기  가 메모리 읽기보다 비용이 많이 드는 경우에 사용*  

<br>

## 소스코드

### python
```python
def selectionSort(x):
	length = len(x)
	for i in range(length-1):
	    indexMin = i
		for j in range(i+1, length):
			if x[indexMin] > x[j]:
				indexMin = j
		x[i], x[indexMin] = x[indexMin], x[i]
	return x
```
### Java
```java
void selectionSort(int[] list) {
    int indexMin, temp;

    for (int i = 0; i < list.length - 1; i++) {
        indexMin = i;
        for (int j = i + 1; j < list.length; j++) {
            if (list[j] < list[indexMin]) {
                indexMin = j;
            }
        }
        temp = list[indexMin];
        list[indexMin] = list[i];
        list[i] = temp;
    }
}
```

<br>

## 정리
 선택 정렬 : 수열 중에서 최솟값을 검색해서 왼쪽 끝에 있는 숫자와 교체하는 정렬 방법  
- 장점
   - 추가 메모리가 필요없다.
   - 자료 이동 횟수가 미리 결정된다.
   - 시간 복잡도 O(n^2)인 정렬 알고리즘에서 버블 정렬보다 우수하다.
 - 단점
   - 동일한 값이 있는 경우에 상대적인 위치가 변경될 수 있다.
      - 개선 방법
         - 이중 선택 정렬 : 한 번의 탐색에서 최솟값과 최댓값을 같이 찾는 방법이다. 탐색 횟수가 절반으로 줄어들게 된다.
         - 탐색을 응용하여 개선 : 한 번의 탐색 때 동일한 값이 있다면 함께 정렬하는 방법이다. 같은 값이 많을 수록 유용하다.
 - T(n) = O(n^2)

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