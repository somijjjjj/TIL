# sys.stdin.readline()과 input()
<br>

## sys 모듈이란?
sys 모듈은 파이썬 인터프리터가 제공하는 변수와 함수를 직접 제어할 수 있게 해주는 모듈이다.
sys 모듈은 강제로 스크립트를 종료할 수도 있고 파이썬 모듈들이 저장된 위치등을 알 수도 있는 등 시스템을 제어할 수 있는 모듈

---

## sys.stdin.readline() 과 input() 차이점


input은 입력받은 값의 개행(줄바꿈) 문자를 삭제시켜 반환되고, **prompt message**를 파라미터로 받아서 사용할 수 있다.

- 원래 문자열에서 어떤 작업을 취했으니 속도가 느려졌을 것.

하지만 sys.stdin.readline은 개행 문자를 포함한 값을 반환되고 prompt message를 파라미터로 받아 사용할 수 없다.  
input에 비해 속도가 느려지진 않았을 것이다.

빠르게 정보를 받아오기 위해서는 sys.stdin.readline을 사용하면 좋기 때문에 알고리즘 문제에서 사용한다.


<br>

# 확인
```python
import sys

input_x = input()
print(input_x)
input_y = sys.stdin.readline()
print(input_y)

print('-----end------')
````
> 결과![](https://velog.velcdn.com/images/silver0/post/fc16128f-6f99-4037-83b7-e0942bde18e9/image.png)

`sys.stdin.readline()`으로 받은 `input_y`는 출력 시 개행 문자가 있어 한 줄이 띄어져 있고

`input()`으로 받은 `input_x`는 개행 문자가 없는 걸 확인할 수 있었다.

<br>


```python
import sys

str_list_x = list(input())
print(str_list_x)

str_list_y = list(sys.stdin.readline())
print(str_list_y)

str_list_y_2 = list(sys.stdin.readline().strip())
print(str_list_y_2)

print('-----end------')
```
> 결과![](https://velog.velcdn.com/images/silver0/post/b6da54d9-5d6d-43ba-8976-531272dc85b7/image.png)

`sys.stdin.readline()`으로 입력받을 시 원치 않게 개행문자가 포함될 수 있으므로 `strip()`함수를 사용하면 개행문자를 제거할 수 있다.

<br>

### 입력을 여러번 받아야 할 경우
`sys.stdin.readline()` 을 쓰는 것이 빠르다.

- why?
propmt 출력여부 및 sys.stdin.readline()은 한 번에 읽어서 버퍼에 저장하고,  
input()은 값을 입력할 때마다 버퍼에 저장하는 데서 오는 속도 차이 때문이라고 한다.
> 한번에 읽어와 버퍼에  저장하는 stdin.readline()가 하나씩 누를 때마다 데이터를 버퍼에 보관하는 input() 보다 처리 속도가 빠르다. 즉, 버퍼 사이즈 차이로 입력이 반복될 수록 stdin.readline()이 우위를 가진다.


<br>

- 한 번에 입력 2개 받기(입력 받아서 int로 변환)  
```python
a, b = map(int, input().split())

import sys
c, d = map(int, sys.stdin.readline().split())
```

<br>

- 입력값 여러 개를 list로 저장하기
```python
numbers = list(map(int, input().split()))
```

<br>

- 문자열 여러줄 입력받기
```python
str_list = [input() for _ in range(n)]
```

<br>
 

- 띄어쓰기 없이 정수 여러 개를 입력받아 2차원 배열로 저장하기
```python
arr = [list(map(int, input())) for _ in range(n)]
```

<br>

- 열은 띄어쓰기로 행은 엔터로 구분하여 입력받아 2차원 배열로 저장하기
```python
arr = [list(map(int, input().split())) for _ in range(n)]
```

<br>

<br>

### [참고]

https://green-leaves-tree.tistory.com/12  
https://developeryuseon.tistory.com/90

