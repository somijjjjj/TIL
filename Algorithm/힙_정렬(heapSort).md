# 힙 정렬(heap sort)

<br>

<span style="background-color:#8c7ae6">힙(heap) 데이터 구조를 사용</span>하는 정렬 방법이다.  
최대 힙 트리나 최소 힙 트리를 구성해 정렬을 하는데,   
내림차순 정렬을 위해서 최소 힙을 구성하고, 오름차순 정렬을 위해서는 최대 힙을 구성하면 된다.  

- 최대 힙(max heap)
  - 부모 노드의 키 값이 자식 노드의 키 값보다 크거나 같은 완전 이진 트리
  - key(부모 노드) >= key(자식 노드)
- 최소 힙(min heap)
  - 부모 노드의 키 값이 자식 노드의 키 값보다 작거나 같은 완전 이진 트리
  - key(부모 노드) <= key(자식 노드)

<br>

> 힙(heap)?
그래프의 트리 구조 중 하나로, '우선순위 큐(priority queue)'를 구현할 때 사용된다.  
우선순위 큐는 데이터 구조의 하나로서 데이터를 자유롭게 추가할 수 있다.  
반면, 데이터를 추출할 때는 최솟값부터 순서대로 선택된다.  
추가는 자유롭게 하고 추출할 때는 작은 값부터 꺼내는 것이 우선순위 큐이다.  
또한, 힙을 표현하는 트리 구조에서는 각 정점을 '노드(node)'라고 부른다.   
힙에서는 각 노드에 데이터가 저장된다.

<br>


<img src="https://i.imgur.com/25zyoSE.gif">
<img src="https://upload.wikimedia.org/wikipedia/commons/4/4d/Heapsort-example.gif">

<br>

힙의 각 노드에 적혀 있는 숫자는 저장돼 있는 데이터이다.  
이 노드들은 최대 두 개의 자식 노드를 가진다.  
또한, 트리의 모양은 데이터의 개수에 의해 정해진다.  
노드는 위에서부터 채워지며, 같은 층(단)에서는 왼쪽부터 채워진다.  

1. n개의 노드에 완전 이진 트리를 구성
2. 내림차순 정렬을 위해서는 최대 힙 구성/오른차순 정렬을 위해서는 최소 힙 구성
3. 가장 위에 있는 요소를 추출하여 배열에 저장(최소 힙이면 최솟값, 최대 힙이면 최댓값)
   - 최대 힙은 꺼낸 요소를 역순으로 나열하면 정렬이 된다.
4. 다시 힙을 재구축하여 같은 방식으로 루트 노드에 있는 요소를 추출하여 배열에 저장하기를 반복
   - 모든 요소들을 힙에서 꺼내면 정렬이 완료된다.

<br>

## 힙(heap) 삽입
1. 힙에 새로운 요소가 들어오면, 힙의 마지막 노드에 삽입한다.  
2. 새로운 노드를 부모 노드와 교환하며 힙의 성질을 만족시킨다.  

<br>

## 힙(heap) 삭제
1. 최댓값, 최솟값을 지닌 루트 노드를 추출(삭제)하게 되면 힙의 구조를 다시 정리해야 한다.
2. 삭제된 루트 노드에는 힙의 마지막 노드를 가장 위로 이동시킨다.
3. 자식 노드들과 비교하며 힙의 성질을 만족하는 노드들과 교환한다.
4. 교환이 발생하지 않을 때까지 반복한다.

<br>

## 정리
힙 정렬 : 최대 힙 트리나 최소 힙 트리를 구성해 정렬을 하는 방법
- 장점
   - 시간 복잡도가 좋은 편이다.
   - 최댓값이나 최솟값을 자주 추출해야 하는 경우네는 힙 정렬이 편리하다.
     - 예를 들어, 다익스트라 알고리즘에서 후보가 되는 노드 중에서 최솟값을 매 단계에서 선택하는데, 이때 노드를 관리하기 위해 힙을 사용하는 경우도 있다.


> - T(n) = O(n log n)  
힙의 높이가 log$_2$n 이하이므로 1회 추가에 O(log n)의 시간이 걸리고 각 라운드에서 최대 숫자를 꺼내서 힙을 재구축하는 데 걸리는 시간은 O(log n)이다.   
라운드 수는 n이므로 힙이 완성된 후에 정렬하는 시간도 O(n log n)이 된다. 따라서 힙 정렬의 계산 시간은 전체적으로 O(n log n)이 된다.  
![](https://velog.velcdn.com/images/silver0/post/dad79612-991a-4350-8665-e7610fd767a3/image.png)


<br>

## 소스코드

### python
```python
def heapify(li, idx, n):
	l = idx * 2
    r = idx * 2 + 1
    s_idx = idx
    if (l <= n and li[s_idx] > li[l]):
    	s_idx = l
    if (r <= n and li[s_idx] > li[r]):
    	s_idx = r
    if s_idx != idx:
    	li[idx], li[s_idx] = li[s_idx], li[idx]
        return heapify(li, s_idx, n)

def heap_sort(v):
	n = len(v)
    v = [0]+v
    
    # main heap  생성
    for i in range(n, 0, -1):
    	heapify(v, i, n)
    
    # min element extract & heap
    for i in range(n, 0, -1):
    	print(v[1])
        v[i], v[1] = v[1], v[i]
        heapify(v, 1, i-1)

heap_sort([5,3,4,2,1])  
```
### Java
```java
public class Heap
{
	private int[] element; //element[0] contains length
	private static final int ROOTLOC = 1;
	private static final int DEFAULT = 10;

	public Heap(int size) {
		if(size>DEFAULT) {element = new int[size+1]; element[0] = 0;}
		else {element = new int[DEFAULT+1]; element[0] = 0;}
	}

	public void add(int newnum) {

		if(element.length <= element[0] + 1) {
			int[] elementTemp = new int[element[0]*2];
			for(int x = 0; x < element[0]; x++) {
				elementTemp[x] = element[x];
			}
			element = elementTemp;
		}
		element[++element[0]] = newnum;
		upheap();
	}

	public int extractRoot() {
		int extracted = element[1];
		element[1] = element[element[0]--];
		downheap();
		return extracted;
	}

	public void upheap() {
		int locmark = element[0];
		while(locmark >= 1 && element[locmark/2] > element[locmark]) {
			swap(locmark/2, locmark);
			locmark /= 2;
		}
	}

	public void downheap() {
		int locmark = 1;
		while(locmark * 2 <= element[0])
		{
			if(locmark * 2 + 1 <= element[0]) {
				int small = smaller(locmark*2, locmark*2+1);
				swap(locmark,small);
				locmark = small;
			}
			else {
				swap(locmark, locmark * 2);
				locmark *= 2;
			}
		}
	}

	public void swap(int a, int b) {
		int temp = element[a];
		element[a] = element[b];
		element[b] = temp;
	}

	public int smaller(int a, int b) {
		return element[a] < element[b] ? a : b;
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