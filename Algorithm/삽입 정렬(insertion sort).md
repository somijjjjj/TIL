# 삽입 정렬(Insertion Sort)

- 자료 배열의 모든 요소를 앞에서부터 차례대로 이미 정렬된 배열 부분과 비교하여 자신의 위치를 찾아 삽입함으로써 정렬을 완성하는 알고리즘이다.
- 매 순서마다 해당 원소를 삽입할 수 있는 위치를 찾아 해당 위치에 넣는다
- 처음 key값은 두번째 자료부터 시작한다.

![](https://velog.velcdn.com/images/silver0/post/a82f25d0-1523-4e74-a751-d0e019e08504/image.png)

<img src="https://upload.wikimedia.org/wikipedia/commons/2/25/Insertion_sort_animation.gif">
<img src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Insertion_sort_001.PNG">

[참고] https://ko.wikipedia.org/wiki/%EC%82%BD%EC%9E%85_%EC%A0%95%EB%A0%AC

<br>
<br>

# 특징
장점
- 안정한 정렬 방법이다.
- 레코드 수가 적을 경우 알고리즘 자체가 매우 간단하므로 다른 복잡한 정렬 방법보다 유리할 수 있다.
- 대부분 레코드가 이미 정렬되어 있는 경우에는 매우 효율적일 수 있다.  

단점
- 비쿄적 많은 레코드들의 이동을 포함한다.
- 레코드 수가 많고 레코드 크기가 클 경우에 적합하지 않다.

<br>

# 복잡도 분석
삽입 정렬은 별도의 추가 공간을 사용하지 않고 주어진 배열이 차지하고 있는 공간 내에서 값들의 위치만 바꾸기 때문에 O(1)의 공간 복잡도를 가진다.
시간 복잡도는 우선 루프문을 통해 정렬 범위를 2개로 시작해서 전체로 확장해야 하기 때문에 기본적으로 O(N)을 시간을 소모하며, 각 패스에서는 정렬 범위에 새롭게 추가된 값과 기존 값들의 대소 비교 및 자리 교대를 위해서 O(N)을 시간이 필요하게 된다.  
- 삽입 정렬은 총 O(N^2)의 시간 복잡도를 가지는 정렬 알고리즘  

아래에서 다룰 최적화를 통해서 부분적으로 정렬된 배열에 대해서 성능을 대폭 개선할 수 있으며, 특히 완전히 정렬되어 있는 배열이 들어올 경우, O(N)까지도 시간 복잡도를 향상시킬 수 있다.


```python
def insertion_sort(arr):
    for end in range(1, len(arr)):
        for i in range(end, 0, -1):
            if arr[i - 1] > arr[i]:
                arr[i - 1], arr[i] = arr[i], arr[i - 1]
```
[참고] https://www.daleseo.com/sort-insertion/