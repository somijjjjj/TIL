# 병합 정렬(merge sort)

<br>

정렬하고 싶은 리스트을 두 개의 리스트로 분할하여 더 이상 분할되지 않는 상태에 이르면 그룹들을 병합한다.  
병합할 때에는 정렬이 끝난 두 개의 리스트를 병합해서 정렬이 끝난 하나의 리스트로 만든다.  
이것을 전체가 하나의 그룹이 될 때까지 반복하는 정렬 방법이다.  

<br>

![](https://velog.velcdn.com/images/silver0/post/5093f1f4-a945-4305-84ed-ece407ca3689/image.gif)

<br>

1. 분할(divide) : 정렬되지 않은 리스트를 절반으로 나눈다.
2. 정복(conquer) : 각 부분 리스트를 재귀적으로 병합 정렬을 한다.
   - 여러 값을 포함하고 있는 리스트들을 서로 병합할 때는 선두의 값을 비교해서 작은 값을 이동시킨다.
3. 결합(combine) : 두 부분 리스트를 다시 하나의 정렬된 리스트로 병합한다. 이때 정렬 결과가 임시 배열에 저장된다.
4. 복사(copy) : 임시 배열에 저장된 결과를 원래 배열에 복사한다.

<br>

## 정리
> 병합 정렬 : <span style="background-color:#8c7ae6">분할 및 정복 알고리즘</span>이다.   
리스트를 분할해 갈 때는 계산 시간이 걸리지 않는다.  
두 개의 정렬이 끝난 리스트를 병합하는 부분은 선두의 수를 비교해서 작은 쪽을 위로 올리는 것을 반복하는 것이 전부이므로   
두 리스트의 길이에 따라 달라진다. 따라서 하나의 층에서 병합 계산 시간은 그 층에 있는 요소들의 수가 된다.
> -  T(n) = O(n log n)

- 장점
   - 안정적인 정렬 방법이다.
   - 최악의 경우 런타임이 O(nlogn)이므로 더 효율적이다.
- 단점
   - 많은 공간(O(n))이 필요하므로 경우에 따라 마지막 데이터에 대한 작업이느려질 수 있다.

*Java 및 기타 많은 언어는 객체 정렬을 위한 기본 기술로 병합 정렬을 사용한다고 한다.*


<br>

## 소스코드

### python
```python
def merge_sort(arr):
    if len(arr) < 2:
        return arr

    mid = len(arr) // 2
    low_arr = merge_sort(arr[:mid])
    high_arr = merge_sort(arr[mid:])

    merged_arr = []
    l = h = 0
    while l < len(low_arr) and h < len(high_arr):
        if low_arr[l] < high_arr[h]:
            merged_arr.append(low_arr[l])
            l += 1
        else:
            merged_arr.append(high_arr[h])
            h += 1
    merged_arr += low_arr[l:]
    merged_arr += high_arr[h:]
    return merged_arr
```
### Java
```java
public class MergeSorter {
    public static int[] sort(int[] arr) {
        if (arr.length < 2) return arr;

        int mid = arr.length / 2;
        int[] low_arr = sort(Arrays.copyOfRange(arr, 0, mid));
        int[] high_arr = sort(Arrays.copyOfRange(arr, mid, arr.length));

        int[] mergedArr = new int[arr.length];
        int m = 0, l = 0, h = 0;
        while (l < low_arr.length && h < high_arr.length) {
            if (low_arr[l] < high_arr[h])
                mergedArr[m++] = low_arr[l++];
            else
                mergedArr[m++] = high_arr[h++];
        }
        while (l < low_arr.length) {
            mergedArr[m++] = low_arr[l++];
        }
        while (h < high_arr.length) {
            mergedArr[m++] = high_arr[h++];
        }
        return mergedArr;
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