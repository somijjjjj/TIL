# 퀵 정렬(quick sort)

<br>

기준이 되는 수(피봇(pivot))를 수열 안에서 임의로 하나를 선택하여 피봇 이외의 수를 '피봇보다 작은 수'와 '피봇 이상인 수'의 두 그룹으로 나누고 "피봇보다 작은 수 < 피봇 < 피봇 이상인 수"로 배치한다.

<br>

퀵 정렬은 불안정 정렬에 속하며, 다른 원소와의 비교만으로 정렬을 수행하는 <span style="background-color:#8c7ae6">비교 정렬</span>에 속한다.

<br>

<img src="https://i.imgur.com/8Rp3g5Q.gif">

<br>

1. 리스트 가운데 임의로 기준이 되는 수(피봇)을 선택한다.
2. 피봇 앞에는 피봇보다 작은 값을, 뒤에는 피봇보다 큰 값을 이동시킨다.
3. 피봇 기준으로 왼쪽과 오른쪽 두 리스트도 각각 위 (1)~(2) 과정을 재귀적으로 반복한다.
   - 각 부분 리스트들이 더 이상 분할이 불가능할 때까지 반복
   
<br>

## 단계
- 분할(divide) : 배열을 피봇 기준으로 비균등하게 2개의 부분 배열로 분할
- 정복(conquer) : 부분 배열을 정렬하여 부분 배열의 크기가 충분히 작지 않으면 순환호출을 이용하여 다시 분할 정복 방법 적용
- 결합(combine) : 정렬된 부분 배열들을 하나의 배열에 합병

<br>

## 정리
퀵 정렬 : <span style="background-color:#8c7ae6">분할 정복 방법</span>을 통해 정렬하는 방법이다.  

<br>

리스트를 분할해 갈 때는 계산 시간이 걸리지 않는다.  
두 개의 정렬이 끝난 리스트를 병합하는 부분은 선두의 수를 비교해서 작은 쪽을 위로 올리는 것을 반복하는 것이 전부이므로 두 리스트의 길이에 따라 달라진다. 따라서 하나의 층에서 병합 계산 시간은 그 층에 있는 요소들의 수가 된다.  
- T(n) = O(n log n)  

<br>

배열들을 반으로 분할하는 과정을 log$_2$n회 반복하면 요소가 하나의 배열이 되어 정렬이 완료가 된다.    
각 층에서 각 요소는 피봇과 1회만 비교되므로 한 층의 계산 시간은 O(n)이 되어 전체 계산 시간은 O(n log n)이 된다.    
최악의 경우 최솟값이 피봇으로 선택되면 모든 숫자가 피봇보다 오른쪽으로 가기 때문에(불균형하게 분할) 재귀가 n층이 돼서 계산 시간이 O(n$^2$)가 된다.   
균형있게 분할할 수 있는 피봇을 선택하면 평균적으로 O(n log n)의 계산 시간이 걸린다.  
시간 복잡도가 O(n log n)를 가지는 다른 정렬 알고리즘과 비교했을 때도 가장 빠르다.  
퀵 정렬이 불필요한 데이터의 이동을 줄이고 먼 거리의 데이터를 교환할 뿐만 아니라, 한 번 결저오딘 피봇들이 추후 연산에서 제외되는 특성 때문이다.  

<br>

- 장점
   - 속도가 빠르다
      - 시간 복잡도가 O(n log n)를 가지는 다른 정렬 알고리즘과 비교했을 때도 가장 빠르다.
   - 추가 메모리 공간을 필요로 하지 않는다.
      - O(log n)만큼의 메모리 필요
- 단점
   - 정렬된 리스트에 대해서는 퀵 정렬의 불균형 분할에 의해 오히려 수행시간이 더 많이 걸린다.
*불균형 분할을 방지하기 위하여 피봇을 선택할 때 리스트를 균등하게 분할할 수 있는 데이터(ex, 중앙값)를 선택한다.*


<br>

## 소스코드

### python
```python
def quicksort(x):
    if len(x) <= 1:
        return x

    pivot = x[len(x) // 2]
    less = []
    more = []
    equal = []
    for a in x:
        if a < pivot:
            less.append(a)
        elif a > pivot:
            more.append(a)
        else:
            equal.append(a)

    return quicksort(less) + equal + quicksort(more)
```
### Java
```java
public void quickSort(int[] arr, int left, int right) {
    int i, j, pivot, tmp;
    if (left < right) {
        i = left;   j = right;
        pivot = arr[(left+right)/2];
        //분할 과정
        while (i < j) {
            while (arr[j] > pivot) j--;
            // 이 부분에서 arr[j-1]에 접근해서 익셉션 발생가능함.
            while (i < j && arr[i] < pivot) i++;

            tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
        //정렬 과정
        quickSort(arr, left, i - 1);
        quickSort(arr, i + 1, right);
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