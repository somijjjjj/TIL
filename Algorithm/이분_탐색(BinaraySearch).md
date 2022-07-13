# 이분 탐색(Binaray Search)

<br>

정렬되어 있는 배열에서 데이터를 찾으려고 시도할 때,
순차탐색처럼 처음부터 하나씩 모든 데이터를 체크하여 값을 찾는 것이 아니라
탐색 범위를 절반씩 줄여가며 찾아가는 방법이다.
- *주요 조건은 정렬되어 있는 배열*
- 변수 3개를 사용하여 탐색한다.
    - start, end, mid
- 찾으려는 데이터와 중간점위치에 있는 데이터를 반복적으로 비교해서 원하는 데이터를 찾는다.

<img src="https://blog.penjee.com/wp-content/uploads/2015/04/binary-and-linear-search-animations.gif">

> 출처 https://velog.io/@kimdukbae/%EC%9D%B4%EB%B6%84-%ED%83%90%EC%83%89-%EC%9D%B4%EC%A7%84-%ED%83%90%EC%83%89-Binary-Search

<img src="https://w.namu.la/s/86d0064cf511a86f2b9aa24a322305c37680361cc6379c9aa5e582afae026d60e551cfe944257877ee9450316d9126dab412106160bbe2a52f94ff3c73c7c536383afcaf3377c71e7d557edca1df0f72ee2eba708c3207ebf733025536c15b5476cc66c4186bba270ab87e4d721684f4">

> 출처 https://namu.wiki/w/%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89


<br>


<br>

## 작동예시
1 2 3 4 5 6라는 값에서 6을 찾고자 한다면
 
배열의 중간에 위치한 3이라는 값과 6을 비교한다.
 
6은 3보다 크므로, 이제 3의 왼쪽에 위치하는 값들은 탐색할 필요가 없으므로
(어차피 3 왼쪽에 있는 수들은 3보다 작기 때문이다)
 
3의 오른쪽에 있는 값들을 대상으로 탐색을 다시 시도한다.
 
이제 4 5 6이 남았으므로, 다시 중간값인 5와 찾고자 하는 대상인 6를 비교한다.
 
6은 5보다 크므로, 5의 오른쪽에 있는 값들을 대상으로만 탐색을 다시 시도한다.
 
이제 6만이 남았는데 6과 6을 비교하면, 값이 일치하므로 탐색을 종료한다.
 
출처: https://satisfactoryplace.tistory.com/39 [만족:티스토리]

<br>

---

## 재귀 함수로 구현한 이진 탐색(이분 탐색)

```python
def binary_search(array, target, start, end):
    if start > end:
        return None
    mid = (start + end) // 2

    # 원하는 값 찾은 경우 인덱스 반환
    if array[mid] == target:
        return mid
    # 원하는 값이 중간점의 값보다 작은 경우 왼쪽 부분(절반의 왼쪽 부분) 확인
    elif array[mid] > target:
        return binary_search(array, target, start, mid - 1)
    # 원하는 값이 중간점의 값보다 큰 경우 오른쪽 부분(절반의 오른쪽 부분) 확인
    else:
        return binary_search(array, target, mid + 1, end)


n, target = list(map(int, input().split()))
array = list(map(int, input().split()))

result = binary_search(array, target, 0, n - 1)
if result is None:
    print('원소가 존재 X')
else:
    print(result + 1)

>>> 4

# sample input
# 10 7
# 1 3 5 7 9 11 13 15 17 19
```

## 비재귀적 이진 탐색(이분 탐색)

```python
def binary_search(array, target, start, end):
    while start <= end:
        mid = (start + end) // 2

        if array[mid] == target: return mid
        # 원하는 값이 중간점의 값보다 작은 경우 왼쪽 부분(절반의 왼쪽 부분) 확인
        elif array[mid] > target: end = mid - 1
        # 원하는 값이 중간점의 값보다 큰 경우 오른쪽 부분(절반의 오른쪽 부분) 확인
        else: start = mid + 1
    return None
```

## 시간복잡도

처음부터 끝까지 원하는 값을 찾을 때까지 탐색을 계속하는 순차 탐색은 Worst Case일 때 O(n)이라는 Time Complexity를 보여준다.
 
10만개의 데이터가 있다면 무려 10만번을 탐색해야 하는 것이다.
 
그러나, Binary Search는 탐색 대상을 절반씩 계속해서 줄여나가기 때문에, Worst Case일 때에도 탐색의 횟수가 log2n 이 되므로 
10만개의 데이터가 있다고 하더라도 약 16번 정도로 탐색을 끝낼 수 있다.
 
Time Complexity는 O(log n)이다.
 
출처: https://satisfactoryplace.tistory.com/39 [만족:티스토리]

- 시간 복잡도는 O(logN)이다. (여기서 log는 log₂이다.)
단계마다 탐색 범위를 반으로(÷2) 나누는 것과 동일하므로 위 시간 복잡도를 가지게 된다.
예를 들어 처음 데이터의 개수가 32개라면, 이론적으로 1단계를 거치면 약 16개의 데이터가 남고, 2단계에서 약 8개, 3단계에서 약 4개의 데이터만 남게 된다.
즉, 이진 탐색(이분 탐색)은 탐색 범위를 절반씩 줄이고, O(logN)의 시간 복잡도를 보장한다.