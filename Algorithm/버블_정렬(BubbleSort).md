# 버블 정렬(Bubble Sort)

## 버블 정렬 알고리즘

<span style="background-color:#8c7ae6">오른쪽부터 왼쪽 방향으로 인접한 두 개의 숫자를 비교해서 교환하는 작업</span>을 반복한다.

*숫자를 옮겨가는 모양이 물속에서 거품이 올라오는 모양과 비슷하다고 해서 버블이라고 한다.*

- 서로 인접한 두 원소를 검사하여 정렬하는 알고리즘
- 인접한 2개의 레코드를 비교하여 크기가 순서대로 되어 있지 않으면 서로 교환
- 선택 정렬과 기본 개념이 유사함

<br>

<img src="https://i.imgur.com/OPRV2ez.gif">

1. 수열의 오른쪽 끝에 있는 두 값을 비교하여 오른쪽 숫자가 작으면 왼쪽 숫자와 교체한다.
2. 한 칸 이동 후 다시 두 값을 비교한 후 위와 같은 방법으로 정렬한다.
3. 왼쪽 끝에 있는 값까지 (1)~(2)작업을 반복하면, (1라운드)수열 중에서 가장 작은 값이 왼쪽 끝으로 오게 된다. 
4. 왼쪽 끝 첫번째 값은 정렬을 끝낸 것으로 간주하여 제외하고, 나머지 수열들을 다시 (1)~(3)작업을 반복한다.

버블 정렬은 1라운드에서 n-1회, 2라운드에서 n-2회, ... n라운드에서 1회를 비교한다.  
이 때문에 비교 횟수는 `(n-1)+(n-2)+ … + 2 + 1 = n(n-1)/2` 이다.  
이 비교 횟수는 입력 데이터의 순서와 상관없이 일정하고, 숫자의 교체 횟수는 입력 데이터에 의존한다.  
극단적으로 입력 데이터가 우연히 작은 순서대로 나열돼 있을 때는 교체가 한 번도 발생하지 않고,  
반대로 숫자가 큰 순서대로 나열돼 있으면 비교할 때마다 교체해 주어야 한다.  
따라서 시간복잡도는 O(n^2)가 된다.


무작위 배열수의 거품 정렬 예  
<img src ="https://upload.wikimedia.org/wikipedia/commons/3/37/Bubble_sort_animation.gif">

[참고]https://ko.wikipedia.org/wiki/%EA%B1%B0%ED%92%88_%EC%A0%95%EB%A0%AC

<br>

## 특징
장점
- 구현이 매우 간단하다

단점
- 순서에 맞지 않은 요소를 인접한 요소와 교환한다
- 하나의요소가 가장 왼쪽에서 가장 오른쪽으로 이동하기 위해서는 배열에서 모든 다른 요소들과 교환되어야 한다
- 특히 특정 요소가 이미 최종 정렬 위치에 있는 경우라도 교환이 일어난다.
- 일반적으로 버블정렬은 단순성에도 불구하고 거의 쓰이지 않는다(비효율적)

<br>

## 소스코드

### python
```python
def bubbleSort(x):
	length = len(x)-1
	for i in range(length):
		for j in range(length-i):
			if x[j] > x[j+1]:
				x[j], x[j+1] = x[j+1], x[j]
	return x
```
### Java
```java
void bubbleSort(int[] arr) {
    int temp = 0;
	for(int i = 0; i < arr.length - 1; i++) {
		for(int j= 1 ; j < arr.length-i; j++) {
			if(arr[j]<arr[j-1]) {
				temp = arr[j-1];
				arr[j-1] = arr[j];
				arr[j] = temp;
			}
		}
	}
	System.out.println(Arrays.toString(arr));
}
```

